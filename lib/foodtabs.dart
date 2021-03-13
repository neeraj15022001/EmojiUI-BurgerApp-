import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  FoodTab({Key key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              buildListItem(
                'Delicious Hotdog',
                '\$10',
                '\$5',
                'assets/hotdog.png',
                Colors.red[100],
              ),
              buildListItem(
                "Cheesy Pizza",
                "\$16",
                "\$12",
                "assets/pizza.png",
                Colors.red[100],
              )
            ],
          )),
    );
  }

  Padding buildListItem(
    String itemName,
    String actualPrice,
    String discountedPrice,
    String imagePath,
    Color bgColor,
  ) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 210.0,
              child: Row(
                children: [
                  Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: bgColor,
                    ),
                    child: Center(
                        child: Image.asset(
                      imagePath,
                      width: 50.0,
                      height: 50.0,
                    )),
                  ),
                  SizedBox(
                    width: 28.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemName),
                      SmoothStarRating(
                        rating: 3,
                        isReadOnly: false,
                        size: 15,
                        color: Colors.yellow,
                        borderColor: Colors.grey,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        onRated: (value) {
                          // print("rating value dd -> ${value.truncate()}");
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            discountedPrice,
                            style: TextStyle(fontSize: 20.0, color: Colors.red),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            actualPrice,
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12.0),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            FloatingActionButton(
              heroTag: itemName,
              backgroundColor: Colors.red[300],
              onPressed: null,
              mini: true,
              child: Center(
                child: Icon(Icons.add),
              ),
            )
          ],
        ));
  }
}
