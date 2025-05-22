import 'package:api_test/widgets/buy_button.dart';
import 'package:api_test/widgets/cart_view.dart';
import 'package:api_test/widgets/main_header.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: SafeArea(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              main_header(),

              Expanded(child: CartView()),

              // PLACE ORDER BUTTON GOES HERE

            ],

          ),
        )

    );

  }

}