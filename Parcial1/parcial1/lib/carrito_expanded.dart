import 'package:flutter/material.dart';

import 'api.dart';
import 'modules/compra_instance.dart';
import 'modules/producto_item.dart';

class CarritoExpanded extends StatelessWidget {
  const CarritoExpanded({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrito #$id')),
      body: FutureBuilder<DetalleCarrito>(
        future: Api.detalleCarrito(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('No se pudo cargar el carrito'));
          }
          final detalle = snapshot.data!;
          var total = 0.0;
          for (var i = 0; i < detalle.productos.length; i++) {
            total +=
                detalle.productos[i].price *
                detalle.carrito.productos[i].quantity;
          }
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 12),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Cliente',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Nombre: ${detalle.usuario.nombre}'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Correo: ${detalle.usuario.correo}'),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Text(
                  'Productos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              for (var i = 0; i < detalle.productos.length; i++)
                ProductoItem(
                  imageUrl: detalle.productos[i].image,
                  title: detalle.productos[i].title,
                  category: detalle.productos[i].category,
                  price: detalle.productos[i].price.toStringAsFixed(2),
                  quantity: detalle.carrito.productos[i].quantity,
                ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
