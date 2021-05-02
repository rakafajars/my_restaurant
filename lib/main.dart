import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_restaurant/bloc/restaurant_bloc.dart';
import 'package:my_restaurant/common/navigation.dart';
import 'package:my_restaurant/data/database_local/database_helper.dart';
import 'package:my_restaurant/provider/database_provider.dart';
import 'package:my_restaurant/provider/scheduling_provider.dart';
import 'package:my_restaurant/ui/restauran_page.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DatabaseProvider>(
          create: (_) => DatabaseProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
          create: (_) => SchedulingProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<RestaurantBloc>(
              create: (context) => RestaurantBloc()
                ..add(
                  GetListRestaurantFromApi(),
                ),
            ),
          ],
          child: RestauranPage(),
        ),
      ),
    );
  }
}
