import '../models/producto.dart';

class Carrito {
  const Carrito({
    required this.id,
    required this.userId,
    required this.productos,
  });

  final int id;
  final int userId;
  final List<ProductoCarrito> productos;

  factory Carrito.fromJson(Map<String, dynamic> json) => Carrito(
    id: json['id'] as int,
    userId: json['userId'] as int,
    productos: (json['products'] as List)
        .map((item) => ProductoCarrito.fromJson(item as Map<String, dynamic>))
        .toList(),
  );
}

class ProductoCarrito {
  const ProductoCarrito({required this.productId, required this.quantity});

  final int productId;
  final int quantity;

  factory ProductoCarrito.fromJson(Map<String, dynamic> json) =>
      ProductoCarrito(
        productId: json['productId'] as int,
        quantity: json['quantity'] as int,
      );
}

class Usuario {
  const Usuario({required this.nombre, required this.correo});

  final String nombre;
  final String correo;

  factory Usuario.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>;
    return Usuario(
      nombre: '${name['firstname']} ${name['lastname']}',
      correo: json['email'] as String,
    );
  }
}

class DetalleCarrito {
  const DetalleCarrito({
    required this.carrito,
    required this.usuario,
    required this.productos,
  });

  final Carrito carrito;
  final Usuario usuario;
  final List<Producto> productos;
}
