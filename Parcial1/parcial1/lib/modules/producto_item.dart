import 'package:flutter/material.dart';

class ProductoItem extends StatelessWidget {
  const ProductoItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    this.quantity,
  });

  final String imageUrl;
  final String title;
  final String category;
  final String price;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Image.network(imageUrl, width: 44, height: 58, fit: BoxFit.contain),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$category - \$$price${quantity == null ? '' : ' x $quantity'}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    if (quantity != null)
                      Text(
                        '\$${(double.parse(price) * quantity!).toStringAsFixed(2)}',
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
