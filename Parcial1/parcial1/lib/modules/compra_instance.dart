import 'package:flutter/material.dart';
import 'package:parcial1/models/producto.dart';

class Carrito extends StatelessWidget {
  const Carrito({
    super.key,
    required this.title,
    required this.clienteNombre,
    required this.clienteCorreo,
    required this.productos,
  });

  final String title;
  final String clienteNombre;
  final String clienteCorreo;
  final List<Producto> productos;

  @override
  Widget build(BuildContext context) {
    final total = productos.fold<double>(
      0,
      (total, producto) => total + producto.price,
    );

    return Row(
      children: [
        Image.asset('lib/src/carritocomprasicon.png', width: 100, height: 100),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(clienteNombre),
              Text(clienteCorreo),
              ...productos.map((producto) => Text(producto.title)),
              Text(total.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
