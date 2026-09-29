import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/producto.dart';
import 'modules/compra_instance.dart';

class Api {
  static const _store = 'https://fakestoreapi.com';

  static Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode != 200) throw Exception('Invalid credentials');
  }

  static Future<dynamic> _get(String path) async {
    final response = await http.get(Uri.parse('$_store$path'));
    if (response.statusCode != 200) throw Exception('Request failed');
    return jsonDecode(response.body);
  }

  static Future<List<Producto>> productos() async =>
      ((await _get('/products')) as List)
          .map((json) => Producto.fromJson(json as Map<String, dynamic>))
          .toList();

  static Future<Producto> producto(int id) async =>
      Producto.fromJson(await _get('/products/$id') as Map<String, dynamic>);

  static Future<void> agregarAlCarrito(int productId) async {
    final response = await http.post(
      Uri.parse('$_store/carts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': 1,
        'date': DateTime.now().toIso8601String().split('T').first,
        'products': [
          {'productId': productId, 'quantity': 1},
        ],
      }),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Add failed');
    }
  }

  static Future<void> eliminarProducto(int id) async {
    final response = await http.delete(Uri.parse('$_store/products/$id'));
    if (response.statusCode != 200) throw Exception('Delete failed');
  }

  static Future<List<Carrito>> carritos() async =>
      ((await _get('/carts')) as List)
          .map((json) => Carrito.fromJson(json as Map<String, dynamic>))
          .toList();

  static Future<Carrito> carrito(int id) async =>
      Carrito.fromJson(await _get('/carts/$id') as Map<String, dynamic>);

  static Future<Usuario> usuario(int id) async =>
      Usuario.fromJson(await _get('/users/$id') as Map<String, dynamic>);

  static Future<DetalleCarrito> detalleCarrito(int id) async {
    final cart = await carrito(id);
    final results = await Future.wait([
      usuario(cart.userId),
      ...cart.productos.map((item) => producto(item.productId)),
    ]);
    return DetalleCarrito(
      carrito: cart,
      usuario: results.first as Usuario,
      productos: results.skip(1).cast<Producto>().toList(),
    );
  }
}
