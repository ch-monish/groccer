import 'package:flutter/material.dart';
import 'package:grocer/providers/cart_provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:provider/provider.dart';
import 'package:grocer/providers/items_provider.dart';

class Detailsview extends StatefulWidget {
  Detailsview({Key? key}) : super(key: key);

  @override
  _DetailsviewState createState() => _DetailsviewState();
}

class _DetailsviewState extends State<Detailsview> {
  static const IconData minus = IconData(0xf70f);
  final List<Map<String, dynamic>> _quantity = [
    {
      'value': 1,
      "label": 1,
    },
    {
      'value': 2,
      "label": 2,
    },
    {
      'value': 3,
      "label": 3,
    },
    {
      'value': 4,
      "label": 4,
    },
    {
      'value': 5,
      "label": 5,
    },
    {
      'value': 6,
      "label": 6,
    },
    {
      'value': 7,
      "label": 7,
    },
    {
      'value': 8,
      "label": 8,
    },
    {
      'value': 9,
      "label": 9,
    },
    {
      'value': 10,
      "label": 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = '1';
    final Item data = ModalRoute.of(context)!.settings.arguments as Item;
    List<Cartitems> addedcartitems =
        context.watch<Cartobject>().getcartitemsfun();
    List<String> itemnamelist = [];
    for (Cartitems s in addedcartitems) {
      itemnamelist.add(s.name);
    }

    if (itemnamelist.contains(data.name)) {
      var index = addedcartitems.indexWhere((e) => e.name == data.name);

      setState(() {
        dropdownValue = addedcartitems[index].quantity.toString();
      });
    }
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
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(fontSize: 24),
              ),
              data.stock > 1
                  ? Container(
                      // height: MediaQuery.of(context).size.height / 2,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Image.network(
                        "https://st2.depositphotos.com/7036298/10694/i/600/depositphotos_106948346-stock-photo-ripe-red-apple-with-green.jpg",
                      ))
                  : Container(
                      // height: MediaQuery.of(context).size.height / 2,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.transparent, BlendMode.saturation),
                        child: Image.network(
                          "https://st2.depositphotos.com/7036298/10694/i/600/depositphotos_106948346-stock-photo-ripe-red-apple-with-green.jpg",
                        ),
                      )),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: data.stock > 1
                    ? Text("In Stock",
                        style: TextStyle(fontSize: 25, color: Colors.green))
                    : Text("Out of Stock",
                        style: TextStyle(fontSize: 25, color: Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text("₹", style: TextStyle(fontSize: 18)),
                    Text(data.price.toString(),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w200)),
                    Text(" (₹25.00/100 g)", style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quantity", style: TextStyle(fontSize: 25)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        // height: 80,
                        // width: 100,
                        child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (newValue) {
                        print(newValue);
                        // setState(() {
                        //   dropdownValue = newValue!;
                        //   print(dropdownValue);
                        // });

                        if (itemnamelist.contains(data.name)) {
                          // context.read<Cartobject>().removeItem(data.name);
                          context.read<Cartobject>().updateItem(Cartitems(
                              data.name,
                              data.price,
                              int.parse(newValue.toString())));
                        } else {
                          context.read<Cartobject>().addItem(Cartitems(
                              data.name,
                              data.price,
                              int.parse(newValue.toString())));
                        }
                      },
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            if (itemnamelist.contains(data.name)) {
                              // context.read<Cartobject>().removeItem(data.name);
                              context.read<Cartobject>().updateItem(Cartitems(
                                  data.name,
                                  data.price,
                                  int.parse(dropdownValue)));
                            } else {
                              context.read<Cartobject>().addItem(Cartitems(
                                  data.name,
                                  data.price,
                                  int.parse(dropdownValue)));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Add to Cart',
                                  style: TextStyle(fontSize: 16)))))
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "About this Item",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  data.description,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            ],
          ),
        )));
  }
}

void useEffect(Null Function() param0, List list) {}
