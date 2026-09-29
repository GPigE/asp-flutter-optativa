import 'package:flutter/material.dart';

import 'api.dart';
import 'models/producto.dart';

class ProductoExpanded extends StatelessWidget {
  const ProductoExpanded({
    super.key,
    required this.productoId,
    required this.onDelete,
  });

  final int productoId;
  final VoidCallback onDelete;

  Future<void> _agregar(BuildContext context) async {
    try {
      await Api.agregarAlCarrito(productoId);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Producto agregado')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo agregar el producto')),
        );
      }
    }
  }

  Future<void> _eliminar(BuildContext context) async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar producto'),
        content: const Text('¿Deseas eliminar este producto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (confirmado != true) return;
    try {
      await Api.eliminarProducto(productoId);
      if (!context.mounted) return;
      onDelete();
      Navigator.pop(context);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo eliminar el producto')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del producto')),
      body: FutureBuilder<Producto>(
        future: Api.producto(productoId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('No se pudo cargar el producto'));
          }
          final producto = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    producto.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 24),
                Image.network(
                  producto.image,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                Text(producto.description, textAlign: TextAlign.center),
                const SizedBox(height: 24),
                Text(
                  'Precio: \$${producto.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _agregar(context),
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Agregar'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _eliminar(context),
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Eliminar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
