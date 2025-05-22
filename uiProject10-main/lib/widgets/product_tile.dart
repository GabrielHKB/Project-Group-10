import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat/product_detail.dart';
import 'package:api_test/model/imat/shopping_item.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/widgets/buy_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final iMat = context.read<ImatDataHandler>();
    final image = iMat.getImage(product);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1) Large product image
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: image, // directly use the Image widget
              ),
            ),

            const SizedBox(height: 8),

            // 2) Title and subtitle
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${product.price} ${product.unit} ${_brand(context)}',
              style: const TextStyle(fontSize: 14),
            ),

            const Spacer(),

            // 3) Bottom-right aligned buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _favoriteButton(context),
                const SizedBox(width: 8),
                BuyButton(
                  onPressed: () => iMat.shoppingCartAdd(ShoppingItem(product)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _brand(BuildContext context) {
    final detail = context.read<ImatDataHandler>().getDetail(product);
    return detail?.brand ?? '';
  }

  Widget _favoriteButton(BuildContext context) {
    final handler = context.read<ImatDataHandler>();
    final isFav = handler.isFavorite(product);
    return IconButton(
      icon: Icon(
        isFav ? Icons.star : Icons.star_border,
        color: Colors.orange,
      ),
      onPressed: () => handler.toggleFavorite(product),
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
    );
  }
}
