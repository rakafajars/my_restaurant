import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant/bloc/restaurant_bloc.dart';
import 'package:my_restaurant/ui/restauran_page.dart';

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
      home: BlocProvider<RestaurantBloc>(
        create: (context) => RestaurantBloc()
          ..add(
            GetListRestaurantFromApi(),
          ),
        child: RestauranPage(),
      ),
    );
  }
}
