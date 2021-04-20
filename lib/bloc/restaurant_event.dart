part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class GetListRestaurantFromApi extends RestaurantEvent {
  @override
  List<Object> get props => [];
}

class SearchListRestaurantFromApi extends RestaurantEvent {
  final String search;

  SearchListRestaurantFromApi({@required this.search});
  @override
  List<Object> get props => [search];
}
