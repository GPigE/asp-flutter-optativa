import 'package:flutter/material.dart';
import 'package:parcial1/models/producto.dart';

import 'lista_carritos.dart';
import 'modules/compra_instance.dart';
import 'modules/producto_item.dart';
import 'producto_expanded.dart';

class ListaProductos extends StatefulWidget {
  const ListaProductos({
    super.key,
    required this.productos,
    this.carritos = const [],
  });

  final List<Producto> productos;
  final List<Carrito> carritos;

  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  late final List<Producto> productos = [...widget.productos];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListaCarritos(carritos: widget.carritos),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView(
        children: productos.map((producto) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (pageContext) => ProductoExpanded(
                    producto: producto,
                    onAddToCart: () {},
                    onDelete: () {
                      setState(() => productos.remove(producto));
                      Navigator.pop(pageContext);
                    },
                  ),
                ),
              );
            },
            child: ProductoItem(
              imageUrl: producto.image,
              title: producto.title,
              category: producto.category,
              price: producto.price.toString(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
