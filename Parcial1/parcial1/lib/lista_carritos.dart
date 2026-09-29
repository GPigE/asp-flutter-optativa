import 'package:flutter/material.dart';

import 'api.dart';
import 'carrito_expanded.dart';
import 'modules/app_bottom_nav.dart';
import 'modules/compra_instance.dart';

class ListaCarritos extends StatelessWidget {
  const ListaCarritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carritos de compra')),
      body: FutureBuilder<List<Carrito>>(
        future: Api.carritos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se pudieron cargar los carritos'),
            );
          }
          return ListView(
            children: snapshot.data!
                .map(
                  (carrito) => ListTile(
                    leading: Image.asset(
                      'lib/src/carritocomprasicon.png',
                      width: 44,
                    ),
                    title: Text('Cliente - ${carrito.userId}'),
                    subtitle: const Text('Click para ver detalles'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CarritoExpanded(id: carrito.id),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
      bottomNavigationBar: AppBottomNav(
        index: 1,
        onTap: (index) {
          if (index == 0) Navigator.pop(context);
        },
      ),
    );
  }
}
