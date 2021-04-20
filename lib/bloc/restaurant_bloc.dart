import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/network/repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial());

  Repository _repository = ApiServiceWithRepository();
  ModelListRestaurant _modelListRestaurant;

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
    if (event is GetListRestaurantFromApi) {
      yield RestaurantLoadInProgress();
      try {
        _modelListRestaurant = await _repository.getListRestaurant();

        yield RestaurantLoadedSuccess(
          modelListRestaurant: _modelListRestaurant,
        );
      } catch (e) {
        yield RestaurantLoadedError(
          message: "$e",
        );
      }
    }
    if (event is SearchListRestaurantFromApi) {
      yield RestaurantLoadInProgress();

      try {
        _modelListRestaurant = await _repository.searchListRestaurant(
          search: event.search,
        );

        yield RestaurantLoadedSuccess(
          modelListRestaurant: _modelListRestaurant,
        );
      } catch (e) {
        yield RestaurantLoadedError(
          message: "$e",
        );
      }
    }
  }
}
