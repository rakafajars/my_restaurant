import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/model/m_detail_restaurant.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:my_restaurant/model/m_menu_restaurant.dart';
import 'package:my_restaurant/theme/theme.dart';

class DetailRestaurant extends StatelessWidget {
  final ModelDetailRestaurant modelDetailRestaurant;

  const DetailRestaurant({
    Key key,
    @required this.modelDetailRestaurant,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  tag: modelDetailRestaurant.imagePath,
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
                        image: AssetImage(
                          modelDetailRestaurant.imagePath,
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
                    '${modelDetailRestaurant.nameRestaurant}',
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
                        modelDetailRestaurant.addressRestaurant,
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
                      modelDetailRestaurant.detailRestaurant,
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
                                '${listMenuRestaurant[index].nameFood}',
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
              // child: ListView(
              //   padding: EdgeInsets.only(
              //     left: 20,
              //   ),
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     Container(
              //       height: 100,
              //       width: 160,
              //       decoration: BoxDecoration(
              //         color: Colors.grey,
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(
              //             8,
              //           ),
              //         ),
              //         image: DecorationImage(
              //           image: AssetImage(
              //             '${modelDetailRestaurant.imagePath}',
              //           ),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       child: Align(
              //         alignment: Alignment.bottomLeft,
              //         child: Container(
              //           height: 40,
              //           width: 70,
              //           padding: EdgeInsets.only(
              //             left: 4,
              //           ),
              //           margin: EdgeInsets.only(
              //             bottom: 10,
              //             left: 8,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(8.0),
              //             ),
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Seblak',
              //                 style: googlePoopinsSubHeader.copyWith(
              //                   fontSize: 12,
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               Text(
              //                 'Rp. 5.500',
              //                 style: googlePoopinsSubHeader.copyWith(
              //                   fontSize: 12,
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
