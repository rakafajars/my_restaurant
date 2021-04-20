import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:my_restaurant/network/api_service.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  ModelListRestaurant _modelListRestaurant;
  String _message = '';
  ResultState _state;

  RestaurantProvider({@required this.apiService}) {
    _getListRestaurant();
  }

  String get message => _message;

  ModelListRestaurant get modelListRestaurant => _modelListRestaurant;

  ResultState get state => _state;

  Future<dynamic> _getListRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final listRestaurant = await apiService.getListRestaurant();
      if (listRestaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _modelListRestaurant = listRestaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}
