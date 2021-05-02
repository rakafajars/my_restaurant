import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_restaurant/common/navigation.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        print('Notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload);
    });
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    ModelListRestaurant modelListRestaurant,
  ) async {
    var _channelId = '1';
    var _channelName = 'channel_01';
    var _channelDescription = 'Restaurant Channel';

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      _channelDescription,
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
      styleInformation: DefaultStyleInformation(true, true),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    var titleNotification = "<b>Headline Restaurant </b>";
    var titleRestaurant = modelListRestaurant.restaurants[0].name;

    await flutterLocalNotificationsPlugin.show(
        0, titleNotification, titleRestaurant, platformChannelSpecifics,
        payload: json.encode(modelListRestaurant.toJson()));
  }

  void configureSelectNotificlarrationSubject(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = ModelListRestaurant.fromJson(json.decode(payload));
      var restaurant = data.restaurants[0];

      Navigation.intentWithData(route, restaurant);
    });
  }
}
