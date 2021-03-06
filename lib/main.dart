import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multifunctions/screens/home.dart';

import 'package:multifunctions/models/cart.dart';
import 'package:multifunctions/models/catalog.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Multifunction App',
      //  theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHome(),
          //'/catalog': (context) => const MyCatalog(),
         // '/cart': (context) => const MyCart(),
          //'/buy': (context) => const MyPayment(),
        },
      ),
    );
  }
}