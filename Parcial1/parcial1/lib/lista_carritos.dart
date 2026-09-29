import 'package:flutter/material.dart';

import 'carrito_expanded.dart';
import 'modules/compra_instance.dart';

class ListaCarritos extends StatelessWidget {
  const ListaCarritos({super.key, required this.carritos});

  final List<Carrito> carritos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carritos')),
      body: ListView(
        children: carritos.map((carrito) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarritoExpanded(carrito: carrito),
                ),
              );
            },
            child: carrito,
          );
        }).toList(),
      ),
    );
  }
}
