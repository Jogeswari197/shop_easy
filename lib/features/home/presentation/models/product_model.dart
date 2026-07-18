class ProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final int discount;
  final bool isFavorite;
  final String description;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
    this.discount = 0,
    this.isFavorite = false,
  });
}