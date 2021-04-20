import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_menu_restaurant.dart';
import 'package:my_restaurant/provider/detail_restaurant_provider.dart';
import 'package:my_restaurant/provider/result_state.dart';
import 'package:my_restaurant/theme/theme.dart';
import 'package:provider/provider.dart';

class DetailRestaurant extends StatelessWidget {
  final String pictureId;

  const DetailRestaurant({Key key, this.pictureId}) : super(key: key);
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
                      Hero(
                        tag: pictureId,
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
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
                                'https://restaurant-api.dicoding.dev/images/large/$pictureId',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back,
                              size: 34,
                              color: Colors.grey,
                            ),
                          ),
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
                              state.modelDetailRestaurant.restaurant.address,
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
                            state.modelDetailRestaurant.restaurant.description,
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
                        var nameFood = state.modelDetailRestaurant.restaurant
                            .menus.foods[index].name;

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nameFood,
                                      style: googlePoopinsSubHeader.copyWith(
                                        fontSize: 12,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${listMenuRestaurant[index].priceFood}',
                                      style: googlePoopinsSubHeader.copyWith(
                                        fontSize: 12,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                      ),
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
      // body: SafeArea(
      //   child: ListView(
      //     padding: EdgeInsets.only(
      //       bottom: 24,
      //     ),
      //     children: [
      //       /// Header Image
      //       Stack(
      //         alignment: Alignment.topLeft,
      //         children: [
      //           Hero(
      //             tag: modelDetailRestaurant.imagePath,
      //             child: Container(
      //               height: 250,
      //               width: double.infinity,
      //               decoration: BoxDecoration(
      //                 color: Colors.red,
      //                 borderRadius: BorderRadius.only(
      //                   bottomRight: Radius.circular(
      //                     8.0,
      //                   ),
      //                   bottomLeft: Radius.circular(
      //                     8.0,
      //                   ),
      //                 ),
      //                 image: DecorationImage(
      //                   image: AssetImage(
      //                     modelDetailRestaurant.imagePath,
      //                   ),
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Positioned(
      //             top: 20,
      //             left: 10,
      //             child: GestureDetector(
      //               onTap: () {
      //                 Navigator.pop(context);
      //               },
      //               child: Container(
      //                 height: 40,
      //                 width: 40,
      //                 decoration: BoxDecoration(
      //                     shape: BoxShape.circle, color: Colors.white),
      //                 alignment: Alignment.center,
      //                 child: Icon(
      //                   Icons.arrow_back,
      //                   size: 34,
      //                   color: Colors.grey,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 16,
      //       ),
      //
      //       /// Informasi Restaurant
      //       Container(
      //         margin: EdgeInsets.only(
      //           left: 20,
      //           right: 20,
      //         ),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.max,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               '${modelDetailRestaurant.nameRestaurant}',
      //               style: googlePoopinsHeader,
      //             ),
      //             Row(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 Icon(
      //                   Icons.add_location,
      //                   size: 12,
      //                   color: Colors.grey,
      //                 ),
      //                 Text(
      //                   modelDetailRestaurant.addressRestaurant,
      //                   style: googlePoopinsSubHeader,
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: 16,
      //             ),
      //
      //             /// Detail Informasi Restaurant
      //             Container(
      //               width: double.infinity,
      //               child: Text(
      //                 modelDetailRestaurant.detailRestaurant,
      //                 style: googlePoopinsSubHeader.copyWith(
      //                   fontWeight: FontWeight.w500,
      //                   fontSize: 16,
      //                 ),
      //                 textAlign: TextAlign.justify,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 24,
      //       ),
      //
      //       Padding(
      //         padding: EdgeInsets.only(
      //           left: 20,
      //         ),
      //         child: Text(
      //           "Menu Restaurant",
      //           style: googlePoopinsHeader,
      //         ),
      //       ),
      //
      //       SizedBox(
      //         height: 12,
      //       ),
      //
      //       /// Menu Restaurant
      //       Container(
      //         height: 100,
      //         width: double.infinity,
      //         child: ListView.builder(
      //           itemCount: listMenuRestaurant.length,
      //           shrinkWrap: true,
      //           padding: EdgeInsets.only(
      //             left: 20,
      //           ),
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, int index) {
      //             return Padding(
      //               padding: const EdgeInsets.only(
      //                 right: 16,
      //               ),
      //               child: Container(
      //                 height: 100,
      //                 width: 160,
      //                 decoration: BoxDecoration(
      //                   color: Colors.grey,
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(
      //                       8,
      //                     ),
      //                   ),
      //                   image: DecorationImage(
      //                     image: AssetImage(
      //                       '${listMenuRestaurant[index].imagePath}',
      //                     ),
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //                 child: Align(
      //                   alignment: Alignment.bottomLeft,
      //                   child: Container(
      //                     height: 40,
      //                     width: 100,
      //                     padding: EdgeInsets.only(
      //                       left: 4,
      //                     ),
      //                     margin: EdgeInsets.only(
      //                       bottom: 10,
      //                       left: 8,
      //                     ),
      //                     decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.all(
      //                         Radius.circular(8.0),
      //                       ),
      //                     ),
      //                     child: Column(
      //                       mainAxisSize: MainAxisSize.min,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           '${listMenuRestaurant[index].nameFood}',
      //                           style: googlePoopinsSubHeader.copyWith(
      //                             fontSize: 12,
      //                             color: Colors.black38,
      //                             fontWeight: FontWeight.w600,
      //                           ),
      //                         ),
      //                         Text(
      //                           '${listMenuRestaurant[index].priceFood}',
      //                           style: googlePoopinsSubHeader.copyWith(
      //                             fontSize: 12,
      //                             color: Colors.black38,
      //                             fontWeight: FontWeight.w600,
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
