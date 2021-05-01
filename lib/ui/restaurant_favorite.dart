import 'package:flutter/material.dart';
import 'package:my_restaurant/network/api_service.dart';
import 'package:my_restaurant/provider/database_provider.dart';
import 'package:my_restaurant/provider/detail_restaurant_provider.dart';
import 'package:my_restaurant/provider/result_state.dart';
import 'package:my_restaurant/theme/theme.dart';
import 'package:my_restaurant/ui/detail_restaurant.dart';
import 'package:provider/provider.dart';

class RestaurantFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: Text(
          'Favorite Restaurant',
          style: googlePoopinsHeader,
          maxLines: 1,
        ),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: provider.restaurant.length,
              itemBuilder: (context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),

                    /// Widget Body List Restauran
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (_) => DetailRestaurantProvider(
                                apiService: ApiService(),
                                idKey: provider.restaurant[index].id,
                              ),
                              child: DetailRestaurant(
                                pictureId: provider.restaurant[index].pictureId,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: provider.restaurant[index].pictureId,
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
                                      'https://restaurant-api.dicoding.dev/images/large/${provider.restaurant[index].pictureId}',
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
                                    '${provider.restaurant[index].name}',
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
                                      '${provider.restaurant[index].city}',
                                      style: googlePoopinsSubHeader,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: Text(provider.message),
            );
          }
        },
      ),
    );
  }
}
