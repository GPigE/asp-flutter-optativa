import 'package:flutter/material.dart';

import 'models/producto.dart';

class ProductoExpanded extends StatelessWidget {
  const ProductoExpanded({
    super.key,
    required this.producto,
    required this.onAddToCart,
    required this.onDelete,
  });

  final Producto producto;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              producto.title,
              style: const TextStyle(fontSize: 32, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.network(
                producto.image,
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(height: 16),
            Text(producto.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Text(
              producto.price.toString(),
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAddToCart,
                    child: const Text('Add to cart'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onDelete,
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
