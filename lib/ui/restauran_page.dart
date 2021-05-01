import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restaurant/bloc/restaurant_bloc.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/provider/detail_restaurant_provider.dart';
import 'package:my_restaurant/theme/theme.dart';
import 'package:my_restaurant/ui/restaurant_favorite.dart';
import 'package:provider/provider.dart';

import 'detail_restaurant.dart';

class RestauranPage extends StatefulWidget {
  @override
  _RestauranPageState createState() => _RestauranPageState();
}

class _RestauranPageState extends State<RestauranPage> {
  RestaurantBloc _restaurantBloc;

  @override
  void initState() {
    _restaurantBloc = BlocProvider.of<RestaurantBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _restaurantBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'List Restaurant',
          style: googlePoopinsHeader,
          maxLines: 1,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantFavoritePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 31,
                right: 31,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              child: TextFormField(
                onChanged: (newVal) {
                  print(newVal);
                  if (newVal.length >= 2) {
                    _restaurantBloc
                      ..add(SearchListRestaurantFromApi(search: newVal));
                  } else if (newVal.isEmpty) {
                    _restaurantBloc
                      ..add(
                        GetListRestaurantFromApi(),
                      );
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    size: 14,
                    color: Color(0xFF0F0F11).withOpacity(
                      0.6,
                    ),
                  ),
                  hintText: 'Cari Restaurant Favorit Kamu',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoadInProgress) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is RestaurantLoadedSuccess) {
                  return Expanded(
                    child: state.modelListRestaurant.restaurants.isEmpty
                        ? Center(
                            child: Text(
                              'Restaurant Tidak Ada',
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                state.modelListRestaurant.restaurants.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Widget Body List Restauran
                                  _itemRestaurant(
                                    index,
                                    state.modelListRestaurant,
                                  ),
                                ],
                              );
                            },
                          ),
                  );
                }
                if (state is RestaurantLoadedError) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Koneksi Tidak Ada, Silahkan Cek Kembali Koneksi Anda',
                            maxLines: 1,
                          ),
                          RaisedButton(
                            child: Text('Refresh'),
                            onPressed: () {
                              _restaurantBloc
                                ..add(
                                  GetListRestaurantFromApi(),
                                );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemRestaurant(
    int index,
    ModelListRestaurant modelListRestaurant,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => DetailRestaurantProvider(
                apiService: ApiService(),
                idKey: modelListRestaurant.restaurants[index].id,
              ),
              child: DetailRestaurant(
                pictureId: modelListRestaurant.restaurants[index].pictureId,
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: modelListRestaurant.restaurants[index].pictureId,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8,
                    ),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://restaurant-api.dicoding.dev/images/large/${modelListRestaurant.restaurants[index].pictureId}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 245,
                  child: Text(
                    '${modelListRestaurant.restaurants[index].name}',
                    style: googlePoopinsHeader,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${modelListRestaurant.restaurants[index].city}',
                      style: googlePoopinsSubHeader,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      modelListRestaurant.restaurants[index].rating.toString(),
                      style: googlePoopinsSubHeader.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
