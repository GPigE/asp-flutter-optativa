import 'package:flutter/material.dart';

class ProductoItem extends StatelessWidget {
  const ProductoItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
  });

  final String imageUrl;
  final String title;
  final String category;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageUrl, width: 100, height: 100),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Row(
                children: [
                  Expanded(child: Text(category)),
                  Text(price),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
