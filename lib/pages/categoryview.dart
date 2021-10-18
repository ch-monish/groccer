import 'package:flutter/material.dart';
import 'package:grocer/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:grocer/providers/items_provider.dart';

class Categoryview extends StatefulWidget {
  Categoryview({Key? key}) : super(key: key);

  @override
  _CategoryviewState createState() => _CategoryviewState();
}

class _CategoryviewState extends State<Categoryview> {
  @override
  Widget build(BuildContext context) {
    List<Cartitems> addedcartitems =
        context.watch<Cartobject>().getcartitemsfun();
    List<String> itemnamelist = [];
    for (Cartitems s in addedcartitems) {
      itemnamelist.add(s.name);
    }

    String category = ModalRoute.of(context)!.settings.arguments as String;
    List<Item> groceries = context.watch<Items>().itemcategory(category);
    int addcartitems() {
      int sum = 0;
      for (Cartitems c in context.watch<Cartobject>().getcartitemsfun()) {
        sum += c.quantity;
      }
      return sum;
    }

    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  const IconData(
                    59483,
                    fontFamily: 'MaterialIcons',
                    matchTextDirection: true,
                  ),
                  size: 35,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: [
            Row(
              children: [
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
                              addcartitems().toString(),
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

          // titleTextStyle: Colors.red,
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          childAspectRatio: 1 / 1.5,
          children: List.generate(
            groceries.length,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      color: Colors.white,
                      offset: Offset(1, 1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/detailsview", arguments: groceries[index]);
                  },
                  child: SizedBox(
                      // height: 600,
                      // width: 150,
                      child: Column(
                    children: [
                      SizedBox(
                        // height: 150,
                        // width: 150,
                        child: Image.network(
                          "https://st2.depositphotos.com/7036298/10694/i/600/depositphotos_106948346-stock-photo-ripe-red-apple-with-green.jpg",
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(groceries[index].name,
                                  style: TextStyle(fontSize: 18)),
                              Text("₹" + groceries[index].price.toString(),
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 5),
                          !itemnamelist.contains(groceries[index].name)
                              ? ElevatedButton(
                                  onPressed: () {
                                    print("add to cart");
                                    context.read<Cartobject>().addItem(
                                        Cartitems(groceries[index].name,
                                            groceries[index].price, 1));
                                  },
                                  style: ElevatedButton.styleFrom(),
                                  child: Text('Add to Cart',
                                      style: TextStyle(fontSize: 16)))
                              : ElevatedButton(
                                  onPressed: () {
                                    print("removed from cart");
                                    context
                                        .read<Cartobject>()
                                        .removeItem(groceries[index].name);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                  ),
                                  child: Text('Remove Item',
                                      style: TextStyle(fontSize: 16))),
                        ],
                      ),
                    ],
                  )),
                ),
              );
            },
          ),
        ));
  }
}
