// lib/widgets/left_panel.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/imat_data_handler.dart';
import '../model/imat/product.dart';
import 'category_button.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final handler = context.read<ImatDataHandler>();

    return Container(
      width: 200,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView(
        children: [
          // ─── Frukt ─────────────────────────────
          CategoryButton(
            label: 'Frukt',
            children: [
              CategoryButton(
                label: 'Bär',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.BERRY),
                ),
              ),
              CategoryButton(
                label: 'Citrusfrukt',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.CITRUS_FRUIT),
                ),
              ),
              CategoryButton(
                label: 'Exotisk frukt',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.EXOTIC_FRUIT),
                ),
              ),
              CategoryButton(
                label: 'Meloner',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.MELONS),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ─── Grönsaker ─────────────────────────
          CategoryButton(
            label: 'Grönsaker',
            children: [
              CategoryButton(
                label: 'Grönsaksfrukter',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.VEGETABLE_FRUIT),
                ),
              ),
              CategoryButton(
                label: 'Kål',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.CABBAGE),
                ),
              ),
              CategoryButton(
                label: 'Rotfrukter',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.ROOT_VEGETABLE),
                ),
              ),
              CategoryButton(
                label: 'Örter',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.HERB),
                ),
              ),
              CategoryButton(
                label: 'Baljväxter',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.POD),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ─── Drycker ───────────────────────────
          CategoryButton(
            label: 'Drycker',
            children: [
              CategoryButton(
                label: 'Varma drycker',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.HOT_DRINKS),
                ),
              ),
              CategoryButton(
                label: 'Kalla drycker',
                onTap: () => handler.selectSelection(
                  handler.findProductsByCategory(ProductCategory.COLD_DRINKS),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ─── Övriga kategori―stand alone────────
          CategoryButton(
            label: 'Bröd',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.BREAD),
            ),
          ),
          CategoryButton(
            label: 'Kött',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.MEAT),
            ),
          ),
          CategoryButton(
            label: 'Fisk',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.FISH),
            ),
          ),
          CategoryButton(
            label: 'Mejeriprodukter',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.DAIRIES)
            ),
          ),
          CategoryButton(
            label: 'Fröer & nötter',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.NUTS_AND_SEEDS),
            ),
          ),
          CategoryButton(
            label: 'Mjöl, socker & salt',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.FLOUR_SUGAR_SALT),
            ),
          ),
          CategoryButton(
            label: 'Pasta',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.PASTA),
            ),
          ),
          CategoryButton(
            label: 'Potatis & ris',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.POTATO_RICE)

            ),
          ),
          CategoryButton(
            label: 'Sötsaker',
            onTap: () => handler.selectSelection(
              handler.findProductsByCategory(ProductCategory.SWEET),
            ),
          ),

          const Spacer(),

          // ─── Botton Actions ────────────────────
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).canvasColor,
              foregroundColor: Theme.of(context).primaryColor,
              minimumSize: const Size(double.infinity, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: handler.selectAllProducts,
            child: const Text('Visa allt'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).canvasColor,
              foregroundColor: Theme.of(context).primaryColor,
              minimumSize: const Size(double.infinity, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: handler.selectFavorites,
            child: const Text('Favoriter'),
          ),
        ],
      ),
    );
  }
}
