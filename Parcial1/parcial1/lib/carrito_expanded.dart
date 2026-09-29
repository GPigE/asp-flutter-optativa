import 'package:flutter/material.dart';

import 'modules/compra_instance.dart';
import 'modules/producto_item.dart';

class CarritoExpanded extends StatelessWidget {
  const CarritoExpanded({super.key, required this.carrito});

  final Carrito carrito;

  @override
  Widget build(BuildContext context) {
    final total = carrito.productos.fold<double>(
      0,
      (total, producto) => total + producto.price,
    );

    return Scaffold(
      appBar: AppBar(title: Text(carrito.title), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cliente',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Nombre: ${carrito.clienteNombre}',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              'Correo: ${carrito.clienteCorreo}',
              style: const TextStyle(color: Colors.grey),
            ),
            const Text(
              'Productos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ...carrito.productos.map(
              (producto) => ProductoItem(
                imageUrl: producto.image,
                title: producto.title,
                category: producto.category,
                price: producto.price.toString(),
              ),
            ),
            Text('Total: $total'),
          ],
        ),
      ),
    );
  }
}
