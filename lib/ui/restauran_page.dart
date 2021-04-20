import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/provider/detail_restaurant_provider.dart';
import 'package:my_restaurant/provider/restaurant_provider.dart';
import 'package:my_restaurant/provider/result_state.dart';
import 'package:my_restaurant/theme/theme.dart';
import 'package:provider/provider.dart';

import 'detail_restaurant.dart';

class RestauranPage extends StatefulWidget {
  @override
  _RestauranPageState createState() => _RestauranPageState();
}

class _RestauranPageState extends State<RestauranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.HasData) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Restaurant',
                          style: googlePoopinsHeader,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Recommendation restauran for you!",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.modelListRestaurant.restaurants.length,
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
                  ),
                ],
              ),
            );
          } else if (state.state == ResultState.NoData) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else if (state.state == ResultState.Error) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        },
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
