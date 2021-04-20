import 'package:flutter/material.dart';
import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/provider/restaurant_provider.dart';
import 'package:my_restaurant/ui/restauran_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<RestaurantProvider>(
        create: (_) => RestaurantProvider(
          apiService: ApiService(),
        ),
        child: RestauranPage(),
      ),
    );
  }
}
