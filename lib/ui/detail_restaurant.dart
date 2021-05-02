import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_menu_restaurant.dart';
import 'package:my_restaurant/provider/database_provider.dart';
import 'package:my_restaurant/provider/detail_restaurant_provider.dart';
import 'package:my_restaurant/provider/result_state.dart';
import 'package:my_restaurant/theme/theme.dart';
import 'package:provider/provider.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/restaurant_detal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.HasData) {
            return Consumer<DatabaseProvider>(
              builder: (context, provider, child) {
                return FutureBuilder<bool>(
                  future: provider.isFavoriteRestaurant(
                      state.modelDetailRestaurant.restaurant.id),
                  builder: (context, snapshot) {
                    var isFavoriteRestaurant = snapshot.data ?? false;
                    return SafeArea(
                      child: ListView(
                        padding: EdgeInsets.only(
                          bottom: 24,
                        ),
                        children: [
                          /// Header Image
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                      8.0,
                                    ),
                                    bottomLeft: Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://restaurant-api.dicoding.dev/images/medium/${state.modelDetailRestaurant.restaurant.pictureId}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 34,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    isFavoriteRestaurant
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              provider.removeRestaurant(
                                                state.modelDetailRestaurant
                                                    .restaurant.id,
                                              );
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              provider.addRestaurant(
                                                ModelRestaurantFavorite(
                                                  id: state
                                                      .modelDetailRestaurant
                                                      .restaurant
                                                      .id,
                                                  name: state
                                                      .modelDetailRestaurant
                                                      .restaurant
                                                      .name,
                                                  pictureId: state
                                                      .modelDetailRestaurant
                                                      .restaurant
                                                      .pictureId,
                                                  address: state
                                                      .modelDetailRestaurant
                                                      .restaurant
                                                      .address,
                                                  city: state
                                                      .modelDetailRestaurant
                                                      .restaurant
                                                      .city,
                                                  description: state
                                                      .modelDetailRestaurant
                                                      .restaurant
                                                      .description,
                                                ),
                                              );
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),

                          /// Informasi Restaurant
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.modelDetailRestaurant.restaurant.name}',
                                  style: googlePoopinsHeader,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      state.modelDetailRestaurant.restaurant
                                          .address,
                                      style: googlePoopinsSubHeader,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),

                                /// Detail Informasi Restaurant
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    state.modelDetailRestaurant.restaurant
                                        .description,
                                    style: googlePoopinsSubHeader.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              "Menu Restaurant",
                              style: googlePoopinsHeader,
                            ),
                          ),

                          SizedBox(
                            height: 12,
                          ),

                          /// Menu Restaurant
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: listMenuRestaurant.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                left: 20,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                var nameFood = state.modelDetailRestaurant
                                    .restaurant.menus.foods[index].name;

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 16,
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          8,
                                        ),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          '${listMenuRestaurant[index].imagePath}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        padding: EdgeInsets.only(
                                          left: 4,
                                        ),
                                        margin: EdgeInsets.only(
                                          bottom: 10,
                                          left: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              nameFood,
                                              style: googlePoopinsSubHeader
                                                  .copyWith(
                                                fontSize: 12,
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                            ),
                                            Text(
                                              '${listMenuRestaurant[index].priceFood}',
                                              style: googlePoopinsSubHeader
                                                  .copyWith(
                                                fontSize: 12,
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          } else if (state.state == ResultState.NoData) {
            return Center(
              child: Text('Data Tidak Ada'),
            );
          } else if (state.state == ResultState.Error) {
            return Center(
              child: Text(
                'Koneksi Tidak Ada, Silahkan Cek Kembali Koneksi Anda',
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
}
