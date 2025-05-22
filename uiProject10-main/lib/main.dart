import 'dart:convert';

import 'package:api_test/app_theme.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/pages/main_view.dart';
import 'package:api_test/pages/shopping_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/imat/credit_card.dart';
import 'model/imat/customer.dart';
import 'model/imat/util/functions.dart';
import 'model/internet_handler.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ImatDataHandler(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iMat Demo',
      theme: ThemeData(
        colorScheme: AppTheme.colorScheme,
        iconButtonTheme: AppTheme.buttonTheme,

        // Disable Flutter’s elevation overlay on light surfaces:
        applyElevationOverlayColor: false,

        // Make all ElevatedButtons flat by default:
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(elevation: 0),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainView(),
        '/history': (context) => const HistoryView(),
        '/account': (context) => const AccountView(),
        '/cart': (context) => const ShoppingCartView(),

      },
    );
  }
}












































// This code is not used.
// Included for testing purposes only
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Image? image;

  @override
  void initState() {
    super.initState();
    //loadImage();
  }

  void loadImage() async {
    final img = await InternetHandler.fetchAndCacheImage(114);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _runTests();
            },
            child: const Center(child: Text('Testa')),
          ),
          //image ?? CircularProgressIndicator(),
        ],
      ),
    );
  }

  void _runTests() async {
    //_fetchDetails();
    //var products = await InternetHandler.getProducts();

    //print(products);
    /*
    //var favorites = await InternetHandler.getFavorites();
    //print(favorites);

    var response = await InternetHandler.getProduct(14);
    print(response);

    var json = jsonDecode(response);
    Product product = Product.fromJson(json);
    print('Product ${product.name}');
*/
    var response = await InternetHandler.getCreditCard();
    dbugPrint(response);

    var json = jsonDecode(response);
    CreditCard creditCard = CreditCard.fromJson(json);
    dbugPrint('CreditCard ${creditCard.holdersName}');

    response = await InternetHandler.getCustomer();
    json = jsonDecode(response);
    Customer customer = Customer.fromJson(json);
    dbugPrint('Customer ${customer.firstName} ${customer.lastName}');

    /*
    response = await InternetHandler.getUser();
    print('User ${response}');

    response = await InternetHandler.getOrders();
    //print('Orders ${response}');

    response = await InternetHandler.getShoppingCart();
    print('Orders ${response}');

    var image = await InternetHandler.fetchAndCacheImage(25);
    */
  }
}
