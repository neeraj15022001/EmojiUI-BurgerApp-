import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {
  final imagePath, foodName, pricePerItem, heroTag;
  BurgerPage({this.imagePath, this.foodName, this.pricePerItem, this.heroTag});
  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1.0;

  _buildListItem(String columnNumber) {
    return Column(
      children: [
        if (columnNumber == "1")
          _buildColumnItem("Sweet Cheese", "11", "assets/cheese.png"),
        if (columnNumber == "1")
          _buildColumnItem("Sweet Popcorn", "11", "assets/popcorn.png"),
        if (columnNumber == "2")
          _buildColumnItem("Sweet Cheese", "11", "assets/cheese.png"),
        if (columnNumber == "2")
          _buildColumnItem("Sweet Popcorn", "11", "assets/popcorn.png"),
      ],
    );
  }

  _buildColumnItem(
    String foodName,
    String price,
    String imagePath,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 210.0,
            child: Row(
              children: [
                Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red[200],
                  ),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "\$" + price,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFFF68D7F),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeQuantity(String button) {
    switch (button) {
      case 'MINUS':
        setState(() {
          if (quantity > 0) {
            quantity -= 1;
          }
        });
        break;
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  Stack(children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            color: Colors.red[200],
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0))
                      ]),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 7.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "SUPER",
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                (widget.foodName).toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: widget.heroTag,
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.imagePath),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 45.0,
                            width: 45.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFFE7D6A).withOpacity(0.1),
                                      blurRadius: 6.0,
                                      spreadRadius: 6.0,
                                      offset: Offset(
                                        5.0,
                                        11.0,
                                      ))
                                ]),
                          ),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: Color(0xFFFE7D6A),
                                size: 25.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFE7D6A).withOpacity(0.1),
                                    blurRadius: 6.0,
                                    spreadRadius: 6.0,
                                    offset: Offset(
                                      5.0,
                                      11.0,
                                    ),
                                  )
                                ]),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white),
                            child: Center(
                              child: Icon(
                                Icons.restore,
                                color: Color(0xFFFE7D6A),
                                size: 25.0,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70.0,
                    width: 125.0,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        '\$' +
                            (int.parse(widget.pricePerItem) * quantity)
                                .toString(),
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Color(0xFF5E6166),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 105.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                iconSize: 17.0,
                                icon:
                                    Icon(Icons.remove, color: Colors.red[200]),
                                onPressed: () {
                                  changeQuantity("MINUS");
                                },
                              ),
                              Text(
                                quantity.toInt().toString(),
                                style: TextStyle(color: Colors.red[200]),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.red[200],
                                ),
                                iconSize: 17.0,
                                onPressed: () {
                                  changeQuantity("PLUS");
                                },
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Featured",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                height: 225.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildListItem("1"),
                    _buildListItem("2"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
