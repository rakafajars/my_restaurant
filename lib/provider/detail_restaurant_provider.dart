import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_detail_restaurant.dart';
import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/provider/result_state.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String idKey;

  ModelDetailRestaurant _modelDetailRestaurant;
  String _message = '';
  ResultState _state;

  DetailRestaurantProvider({@required this.apiService, @required this.idKey}) {
    _getListRestaurant(
      idKey: idKey,
    );
  }

  String get message => _message;

  ModelDetailRestaurant get modelDetailRestaurant => _modelDetailRestaurant;

  ResultState get state => _state;

  Future<dynamic> _getListRestaurant({
    @required String idKey,
  }) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final detailRestaurant =
          await apiService.getDetailRestaurant(idKey: idKey);
      if (detailRestaurant.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _modelDetailRestaurant = detailRestaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}
