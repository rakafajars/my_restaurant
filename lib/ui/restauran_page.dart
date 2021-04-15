import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restaurant/model/m_detail_restaurant.dart';
import 'package:my_restaurant/model/m_list_restaurant.dart';
import 'package:my_restaurant/theme/theme.dart';
import 'package:my_restaurant/ui/detail_restaurant.dart';

class RestauranPage extends StatefulWidget {
  @override
  _RestauranPageState createState() => _RestauranPageState();
}

class _RestauranPageState extends State<RestauranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          /// Widget Header
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

          /// Widget Body List Restauran
          Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              listRestaurant.length,
              (index) {
                return _itemRestaurant(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemRestaurant(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRestaurant(
              modelDetailRestaurant: ModelDetailRestaurant(
                imagePath: '${listRestaurant[index].imagePath}',
                nameRestaurant: '${listRestaurant[index].nameRestaurant}',
                addressRestaurant: '${listRestaurant[index].addressRestaurant}',
                rateRestaurant: listRestaurant[index].rateRestaurant,
                detailRestaurant: '${listRestaurant[index].detailRestaurant}',
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
              tag: listRestaurant[index].imagePath,
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
                    image: AssetImage(
                      '${listRestaurant[index].imagePath}',
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
                    '${listRestaurant[index].nameRestaurant}',
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
                      '${listRestaurant[index].addressRestaurant}',
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
                      '4.6',
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
