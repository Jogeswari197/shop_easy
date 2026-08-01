class ProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final String description;
  final int discount;
  final String category;
  final int stock;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.discount,
    required this.category,
    required this.stock,
  });

  factory ProductModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      price: (json["price"] as num).toDouble(),
      imageUrl: json["imageUrl"],
      rating: (json["rating"] as num).toDouble(),
      description: json["description"],
      discount: json["discount"],
      category: json["category"],
      stock: json["stock"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "imageUrl": imageUrl,
      "rating": rating,
      "description": description,
      "discount": discount,
      "category": category,
      "stock": stock,
    };
  }

  factory ProductModel.fromFirestore(
      String id,
      Map<String, dynamic> json,
      ) {
    return ProductModel(
      id: id,
      name: json["name"] as String,
      description: json["description"] as String,
      price: (json["price"] as num).toDouble(),
      imageUrl: json["imageUrl"] as String,
      rating: (json["rating"] as num).toDouble(),
      discount: json["discount"] as int,
      category: json["category"] as String,
      stock: json["stock"] as int,
    );
  }
}