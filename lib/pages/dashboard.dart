import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocer/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:grocer/providers/items_provider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  int _current = 0;
  List imgList = [
    'https://media.istockphoto.com/photos/pasta-on-supermarket-shelves-picture-id1299861504?b=1&k=20&m=1299861504&s=170667a&w=0&h=3UHsvWsc77Nh0SZIi6iigN82qYKBSfO0eJ_Of1KqXCA=',
    'https://images.unsplash.com/photo-1506617564039-2f3b650b7010?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JvY2VyaWVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z3JvY2VyaWVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Cartitems> addedcartitems =
    //     context.watch<Cartobject>().getcartitemsfun();
    int addedcartitems() {
      int sum = 0;
      for (Cartitems c in context.watch<Cartobject>().getcartitemsfun()) {
        sum += c.quantity;
      }
      return sum;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  IconData(
                    58444,
                    fontFamily: 'MaterialIcons',
                    matchTextDirection: true,
                  ),
                  size: 35,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title:
              // Text("Grocery store", style: TextStyle(color: Colors.red)),
              Row(children: [
            Text("Grocery store", style: TextStyle(color: Colors.black)),
          ]),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print("search clicked");
                  },
                  child: Stack(children: [
                    Icon(
                      IconData(
                        58727,
                        fontFamily: 'MaterialIcons',
                        matchTextDirection: true,
                      ),
                      size: 25,
                      color: Colors.black,
                    ),
                  ]),
                ),
                SizedBox(width: 20),
                InkWell(
                    onTap: () {
                      print("cart clicked");
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: Container(
                      width: 60,
                      height: 50,
                      // color: Colors.green,
                      child: Stack(children: [
                        Positioned(
                          bottom: 10,
                          left: 0,
                          child: Icon(
                            IconData(58780, fontFamily: 'MaterialIcons'),
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 20,
                          child: new Container(
                            padding: EdgeInsets.all(2),
                            decoration: new BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: new Text(
                              // addedcartitems.length.toString(),
                              addedcartitems().toString(),
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                    )),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
        drawer: Drawer(
          child: Homepagedrawer(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: imgList.map((item) {
                  // int index = Widget.imgList.indexof(item);
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.fill,
                        )),
                    // child: Center(
                    //   child: Image.network(item),
                    // )
                  );
                }).toList(),
                options: CarouselOptions(
                    aspectRatio: 2.0,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    pageSnapping: true,
                    initialPage: 0,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: DefaultTabController(
                    length: 3, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              unselectedLabelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Colors.greenAccent[400],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                              tabs: [
                                Tab(text: 'Categories'),
                                Tab(text: 'Popular'),
                                Tab(text: 'Whats New'),
                              ],
                            ),
                          ),
                          Container(
                              height: 450, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  // color: Colors.red,
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          GridView.count(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              shrinkWrap: true,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    print("clickkkked");
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            '/categoryview',
                                                            arguments:
                                                                "fruits");
                                                  },
                                                  child: Stack(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/fruits.jpeg'),
                                                          fit: BoxFit.cover,
                                                          colorFilter:
                                                              new ColorFilter
                                                                      .mode(
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.4),
                                                                  BlendMode
                                                                      .darken),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      left: 5,
                                                      child: Text("Fruits",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                    )
                                                  ]),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(context,
                                                        "/categoryview",
                                                        arguments:
                                                            "vegetables");
                                                    print("clickkkked");
                                                  },
                                                  child: Stack(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/vegetables.jpg'),
                                                          fit: BoxFit.cover,
                                                          colorFilter:
                                                              new ColorFilter
                                                                      .mode(
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.4),
                                                                  BlendMode
                                                                      .darken),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      left: 5,
                                                      child: Text("Vegetables",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                    )
                                                  ]),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    print("clickkkked");
                                                  },
                                                  child: Stack(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/groceries_.jpeg'),
                                                          fit: BoxFit.cover,
                                                          colorFilter:
                                                              new ColorFilter
                                                                      .mode(
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.4),
                                                                  BlendMode
                                                                      .darken),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      left: 5,
                                                      child: Text("Essentials",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                    )
                                                  ]),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text("popular"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text("whats new"),
                                  ),
                                ),
                              ]))
                        ])),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconData(
                      58727,
                      fontFamily: 'MaterialIcons',
                      matchTextDirection: true,
                    ),
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text('shop'),
                  backgroundColor: Colors.greenAccent[400]),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconData(
                      59203,
                      fontFamily: 'MaterialIcons',
                      matchTextDirection: true,
                    ),
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text('Profile'),
                  backgroundColor: Colors.red),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            // selectedItemColor: Colors.black,
            iconSize: 20,
            onTap: _onItemTapped,
            selectedItemColor: Colors.white.withOpacity(1),
            unselectedItemColor: Colors.white.withOpacity(.60),
            selectedFontSize: 20,
            unselectedFontSize: 10,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 20),
            elevation: 5));
  }

  Widget Homepagedrawer() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.greenAccent[400],
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://merodesk.com/wp-content/uploads/2021/05/user-4.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Hello!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/account");
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              "My Account",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              IconData(57500, fontFamily: 'MaterialIcons'),
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("Payments",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("Order History",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("Issue Report",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("Support",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("About",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("Help",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("payments");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: 35),
                        Text("Logout",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
