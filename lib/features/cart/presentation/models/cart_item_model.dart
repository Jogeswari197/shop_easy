class CartItemModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  CartItemModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}