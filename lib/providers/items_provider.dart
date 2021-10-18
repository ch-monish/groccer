import 'package:flutter/material.dart';

class Items with ChangeNotifier {
  List<Item> fruits = [
    Item("Apple", 10, 20, "Apple description"),
    Item("Mango", 10, 0, "mango description"),
    Item("Orange", 14, 30, "orange description"),
    Item("Guava", 45, 300, "guava description"),
    Item("Kivi", 40, 60, "kivi description"),
    Item("Lemon", 5, 20, "lemon description")
  ];
  List<Item> vegetables = [
    Item("Carrot", 10, 20, "Carrot description"),
    Item("broccoli", 10, 200, "broccoli description"),
    Item("asparagus", 14, 30, "asparagus description"),
    Item("corn", 45, 300, "corn description"),
    Item("cucumber", 40, 60, "cucumber description"),
    Item("brinjal", 5, 20, "brinjal description")
  ];

  List<Item> itemcategory(item) {
    if (item == "fruits") {
      return fruits;
    } else if (item == "vegetables") {
      return vegetables;
    }
    print("not present");
    return fruits;
  }

  // void additemfun(item, Item) {
  //   if (item == "fruits") {
  //     fruits.add(Item);
  //     notifyListeners();
  //     print("item added to fruits");
  //   } else if (item == "vegetables") {
  //     vegetables.add(Item);
  //     notifyListeners();
  //   }
  // }
}

class Item {
  String name;
  double price;
  String description;
  int stock;
  Item(this.name, this.price, this.stock, this.description);
}
