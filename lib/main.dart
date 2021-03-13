import 'package:emojiui/burgerPage.dart';
import 'package:emojiui/foodtabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(systemNavigationBarColor: Colors.white));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Emoji UI",
        home: DashboardPage());
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(0.0, 3.0))
                        ],
                        color: Color(0xFFC6E7FE),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/tuxedo.png'),
                            fit: BoxFit.contain)),
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "SEARCH FOR",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0),
              ),
              Text(
                "RECEPIES",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16.0)),
                child: TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                )),
              ),
              SizedBox(height: 20.0),
              Text(
                "Recommended",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildItem(
                      'Hamburger',
                      'assets/burger.png',
                      '21',
                      Colors.yellow[800],
                      Colors.yellow[200],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    _buildItem(
                      'Chips',
                      'assets/fries.png',
                      '15',
                      Colors.blue[800],
                      Colors.blue[200],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    _buildItem(
                      'Doughnut',
                      'assets/doughnut.png',
                      "20",
                      Colors.green[800],
                      Colors.green[200],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  labelStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: [
                    Tab(
                      child: Text("FEATURED"),
                    ),
                    Tab(
                      child: Text("COMBO"),
                    ),
                    Tab(
                      child: Text("FAVOURITES"),
                    ),
                    Tab(
                      child: Text("RECOMMENDED"),
                    ),
                  ]),
              Container(
                // height: MediaQuery.of(context).size.height - 450,
                height: 200.0,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    FoodTab(),
                    FoodTab(),
                    FoodTab(),
                    FoodTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(
    String title,
    String imagePath,
    String price,
    Color textColor,
    Color bgColor,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BurgerPage(
                  heroTag: title,
                  foodName: title,
                  pricePerItem: price,
                  imagePath: imagePath,
                )));
      },
      child: Container(
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Image.asset(
                imagePath,
                height: 50.0,
                width: 50.0,
              )),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              title,
              style: TextStyle(color: textColor),
            ),
            Text(
              "\$" + price,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
