import 'package:flutter/material.dart';
import 'package:grocer/providers/items_provider.dart';

class Cartobject with ChangeNotifier {
  List<Cartitems> cartitems = [
    Cartitems("Apple", 20, 4),
    Cartitems("Mango", 40, 3),
    Cartitems("Guava", 50, 10),
    Cartitems("Orange", 20, 5),
  ];
  List<Cartitems> getcartitemsfun() => cartitems;
  void addItem(Item) {
    cartitems.add(Item);
    for (Cartitems c in cartitems) {
      print(c.name + ":" + c.price.toString() + ":" + c.quantity.toString());
    }
    notifyListeners();
    print("------------------------------");
  }

  void removeItem(Item) {
    for (Cartitems c in cartitems) {
      if (c.name == Item) {
        cartitems.remove(c);
        notifyListeners();
      }
    }

    for (Cartitems c in cartitems) {
      print(c.name + ":" + c.price.toString() + ":" + c.quantity.toString());
    }
    print("--------------------------------");
  }

  void updateItem(Item) {
    // print("updating state in provider =" + Item);
    for (Cartitems c in cartitems) {
      if (c.name == Item.name) {
        print(Item.quantity);
        cartitems.remove(c);
      }
    }
    cartitems.add(Item);
    for (Cartitems c in cartitems) {
      print(c.name + ":" + c.price.toString() + ":" + c.quantity.toString());
    }
    notifyListeners();
    print("------------------------------");
  }
}

class Cartitems {
  String name;
  double price;
  int quantity;
  Cartitems(this.name, this.price, this.quantity);
}
