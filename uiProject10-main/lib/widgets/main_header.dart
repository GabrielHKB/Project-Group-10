import 'package:api_test/pages/main_view.dart';
import 'package:api_test/pages/my_pages_view.dart';
import 'package:api_test/pages/shopping_cart_view.dart';
import 'package:api_test/widgets/cart_view.dart';
import 'package:api_test/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/imat/util/functions.dart';
import '../pages/account_view.dart';
import '../pages/history_view.dart';

class main_header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Container(
          color: Color(0xFFD9D9D9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset('assets/images/iMatEdin.jpg', scale: 5),
                onPressed: () {
                  _showMainView(context);
                  dbugPrint('Hemknapp');
                },
              ),
              Search(),
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/kundvagn.png', scale: 3.5),
                    onPressed: () {
                      _showCartView(context);
                      dbugPrint('Kundvagnsknapp.');
                    },
                  ),

                  IconButton(
                    icon: Image.asset('assets/images/mina-sidor.png', scale: 3.5),
                    onPressed: () {
                      _showMyPages(context);
                      dbugPrint('Mina-Sidor-knapp');
                    },
                  ),
                ],
              ),
            ],
          ));
  }

  void _showMainView(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainView()),
    );
  }

  void _showAccount(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountView()),
    );
  }

  void _showHistory(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryView()),
    );
  }

  void _showMyPages(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyPagesView()),
    );
  }
}

void _showCartView(context) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShoppingCartView())
  );
}