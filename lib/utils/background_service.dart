import 'dart:isolate';

import 'dart:ui';

import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/network/repository.dart';
import 'package:my_restaurant/utils/notification_helper.dart';
import 'package:my_restaurant/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService _service;
  static String _isolateName = 'isolate';
  static SendPort _uiSendPort;

  static Repository _repository = ApiServiceWithRepository();

  BackgroundService._createObject();

  factory BackgroundService() {
    if (_service == null) {
      _service = BackgroundService._createObject();
    }
    return _service;
  }

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm Manager');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var result = await _repository.getListRestaurant();
    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  Future<void> someTask() async {
    print('Execute some Process');
  }
}
