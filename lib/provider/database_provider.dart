import 'package:flutter/material.dart';
import 'package:my_restaurant/data/database_local/database_helper.dart';
import 'package:my_restaurant/provider/result_state.dart';

class ModelRestaurantFavorite {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;

  ModelRestaurantFavorite({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
  });

  factory ModelRestaurantFavorite.fromJson(Map<String, dynamic> json) =>
      ModelRestaurantFavorite(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
      };
}

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({
    @required this.databaseHelper,
  }) {
    _getRestaurant();
  }

  ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<ModelRestaurantFavorite> _restaurant = [];
  List<ModelRestaurantFavorite> get restaurant => _restaurant;

  void _getRestaurant() async {
    _restaurant = await databaseHelper.getRestaurant();
    if (_restaurant.length > 0) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  // Logic Untuk Menambahkan Add Restaurant
  void addRestaurant(ModelRestaurantFavorite restaurant) async {
    try {
      await databaseHelper.insertRestaurant(restaurant);
      _getRestaurant();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error $e';
      notifyListeners();
    }
  }

  // Logic untuk mengembalikan status favorite dari restaurant
  Future<bool> isFavoriteRestaurant(String id) async {
    final favoriteRestaurant = await databaseHelper.getRestaurantById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  // Metode Untuk Menghapus Restaurant
  void removeRestaurant(String id) async {
    try {
      await databaseHelper.removeRestaurant(id);
      _getRestaurant();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error $e';
      notifyListeners();
    }
  }
}
