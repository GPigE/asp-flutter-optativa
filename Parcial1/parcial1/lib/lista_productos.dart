import 'package:flutter/material.dart';

import 'api.dart';
import 'lista_carritos.dart';
import 'models/producto.dart';
import 'modules/app_bottom_nav.dart';
import 'modules/producto_item.dart';
import 'producto_expanded.dart';

class ListaProductos extends StatefulWidget {
  const ListaProductos({super.key});

  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  late final Future<List<Producto>> _productos = Api.productos();
  final _eliminados = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuarios')),
      body: FutureBuilder<List<Producto>>(
        future: _productos,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se pudieron cargar los productos'),
            );
          }
          final productos = snapshot.data!.where(
            (producto) => !_eliminados.contains(producto.id),
          );
          return ListView(
            children: productos
                .map(
                  (producto) => InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductoExpanded(
                          productoId: producto.id,
                          onDelete: () =>
                              setState(() => _eliminados.add(producto.id)),
                        ),
                      ),
                    ),
                    child: ProductoItem(
                      imageUrl: producto.image,
                      title: producto.title,
                      category: producto.category,
                      price: producto.price.toStringAsFixed(2),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
      bottomNavigationBar: AppBottomNav(
        index: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ListaCarritos()),
            );
          }
        },
      ),
    );
  }
}
