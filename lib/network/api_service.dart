import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_detail_restaurant.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ModelListRestaurant> getListRestaurant() async {
    final response = await http.get(
      'https://restaurant-api.dicoding.dev/list',
    );
    if (response.statusCode == 200) {
      return ModelListRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<ModelDetailRestaurant> getDetailRestaurant(
      {@required String idKey}) async {
    final response = await http.get(
      'https://restaurant-api.dicoding.dev/detail/$idKey',
    );
    if (response.statusCode == 200) {
      return ModelDetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
