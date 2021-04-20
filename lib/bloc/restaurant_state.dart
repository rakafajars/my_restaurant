part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();
}

class RestaurantInitial extends RestaurantState {
  @override
  List<Object> get props => [];
}

class RestaurantLoadInProgress extends RestaurantState {
  @override
  List<Object> get props => [];
}

class RestaurantLoadedSuccess extends RestaurantState {
  final ModelListRestaurant modelListRestaurant;

  RestaurantLoadedSuccess({this.modelListRestaurant});

  @override
  List<Object> get props => [modelListRestaurant];
}

class RestaurantLoadedError extends RestaurantState {
  final String message;

  RestaurantLoadedError({
    this.message,
  });

  @override
  List<Object> get props => [message];
}
