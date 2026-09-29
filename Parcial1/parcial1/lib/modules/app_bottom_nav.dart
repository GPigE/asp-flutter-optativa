import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.index, required this.onTap});

  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    currentIndex: index,
    onTap: onTap,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Carritos',
      ),
    ],
  );
}
