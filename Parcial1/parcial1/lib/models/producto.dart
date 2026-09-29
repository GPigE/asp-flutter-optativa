class Producto {
  const Producto({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
  });

  final String image;
  final String title;
  final String category;
  final double price;
  final String description;
}
