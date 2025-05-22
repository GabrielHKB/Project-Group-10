// lib/pages/main_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/imat_data_handler.dart';
import '../widgets/main_header.dart';
import '../widgets/filter_bar.dart';
import '../widgets/left_panel.dart';
import '../widgets/product_tile.dart';
import '../widgets/cart_view.dart';
import '../app_theme.dart';

// ← import your ShoppingCartView
import 'shopping_cart_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final products = iMat.selectProducts;

    return Scaffold(
      body: Column(
        children: [
          main_header(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left panel
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: const LeftPanel(),
                ),

                // Center panel: filter + responsive grid
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // FilterBar now takes full width
                      SizedBox(
                        width: double.infinity,
                        child: const FilterBar(),
                      ),
                      const SizedBox(height: 8),
                      // Product grid
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(12),
                          child: GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 280,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 3 / 4,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, idx) =>
                                ProductTile(products[idx]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right panel (cart)
                Padding(
                  padding:
                  const EdgeInsets.only(left: 12.0, top: 8.0, right: 8.0),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Kundvagn',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: AppTheme.paddingMedium),
                        const Expanded(child: CartView()),

                        const SizedBox(height: AppTheme.paddingMedium),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
