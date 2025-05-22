import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/imat_data_handler.dart';
import '../model/imat/shopping_item.dart';
import '../app_theme.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final handler = context.watch<ImatDataHandler>();
    final cart = handler.getShoppingCart();

    if (cart.items.isEmpty) {
      return const Center(child: Text('Kundvagnen är tom'));
    }

    return Column(
      children: [
        // 1) List of items
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(AppTheme.paddingSmall),
            itemCount: cart.items.length,
            separatorBuilder: (_, __) => const Divider(height: 24),
            itemBuilder: (context, idx) {
              final ShoppingItem item = cart.items[idx];
              final name      = item.product.name;
              final unitPrice = item.product.price;
              final qty       = item.amount.toInt();
              final lineTotal = (unitPrice * qty).toStringAsFixed(2);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // A) Name + unit price
                  Expanded(
                    flex: 4, // give a bit more room to the name
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pris: ${unitPrice.toStringAsFixed(2)} kr',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  // B) Quantity controls — fixed width so no overflow
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () =>
                              handler.shoppingCartUpdate(item, delta: -1),
                        ),
                        Text(
                          qty.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () =>
                              handler.shoppingCartUpdate(item, delta: 1),
                        ),
                      ],
                    ),
                  ),

                  // C) Line total
                  Expanded(
                    flex: 2,
                    child: Text(
                      '$lineTotal kr',
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // D) Delete button
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => handler.shoppingCartRemove(item),
                  ),
                ],
              );
            },
          ),
        ),

        // 2) Only the “Visa kundvagn” button remains
        Padding(
          padding: const EdgeInsets.all(AppTheme.paddingSmall),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              child: const Text('Visa kundvagn'),
            ),
          ),
        ),
      ],
    );
  }
}
