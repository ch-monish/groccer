import 'package:flutter/material.dart';
import 'package:grocer/providers/cart_provider.dart';
import 'package:provider/src/provider.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List<String, int> order = [];
  @override
  Widget build(BuildContext context) {
    List<Cartitems> list = context.watch<Cartobject>().getcartitemsfun();
    int calculate() {
      int result = 0;
      for (Cartitems c in list) {
        result += (c.quantity) * (c.price.toInt());
      }
      return result;
    }

    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                const IconData(59483,
                    fontFamily: 'MaterialIcons', matchTextDirection: true),
                size: 35,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Text("Order Summary",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w800)),
          GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            childAspectRatio: 1 / 0.1,
            children: List.generate(
              list.length,
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
                  child: SizedBox(
                      // height: 600,
                      // width: 150,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(list[index].name),
                      Row(
                        children: [
                          
                          Text("Qty : " + list[index].quantity.toString()),
                        ],
                      ),
                      Text("₹" + list[index].price.toString()),
                    ],
                  )),
                );
              },
            ),
          ),
          SizedBox(height:5),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(width: 50),
            Text("Total : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Text("₹" + calculate().toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(width: 40)
          ]),
          ElevatedButton(
              onPressed: () {
                print("Confirm Order");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Confirm Order', style: TextStyle(fontSize: 16))),
        ])));
  }
}
