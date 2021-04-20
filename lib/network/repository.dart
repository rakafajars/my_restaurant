import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';

abstract class Repository {
  Future<ModelListRestaurant> getListRestaurant();
  Future<ModelListRestaurant> searchListRestaurant({
    @required String search,
  });
}
