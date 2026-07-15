class ProductModel {
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final int discount;
  final bool isFavorite;

  const ProductModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.discount = 0,
    this.isFavorite = false,
  });
}