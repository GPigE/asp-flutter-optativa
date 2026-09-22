import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  int quantity = 5;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Pantalla 3'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Nombre del producto',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade100,
              ),
              child: Center(
                child: Image.asset(
                  'lib/assets/producto.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Precio \$1000',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              'Descripción',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 55,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: decreaseQuantity,
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text('-', style: TextStyle(fontSize: 25)),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 55,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: increaseQuantity,
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text('+', style: TextStyle(fontSize: 25)),
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
