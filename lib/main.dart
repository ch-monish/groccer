import 'package:flutter/material.dart';
import 'package:grocer/pages/account.dart';
import 'package:grocer/pages/cart.dart';
import 'package:grocer/pages/categoryview.dart';
import 'package:grocer/pages/dashboard.dart';
import 'package:grocer/pages/detailsview.dart';
import 'package:grocer/pages/login.dart';
import 'package:grocer/pages/verification.dart';
import 'package:grocer/providers/cart_provider.dart';
import 'package:grocer/providers/items_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Items()),
            ChangeNotifierProvider(create: (_) => Cartobject()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),
            routes: {
              // '/': (context) => Login(),
              '/login': (context) => Login(),
              '/verification': (context) => Verification(),
              '/dashboard': (context) => Dashboard(),
              '/categoryview': (context) => Categoryview(),
              "/detailsview": (context) => Detailsview(),
              "/cart": (context) => Cart(),
              "/account": (context) => Account(),
            },
          )),
    );
