class Producto {
  const Producto({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
  });

  final int id;
  final String image;
  final String title;
  final String category;
  final double price;
  final String description;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
    id: json['id'] as int,
    image: json['image'] as String,
    title: json['title'] as String,
    category: json['category'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
  );
}
