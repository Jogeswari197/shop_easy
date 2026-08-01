import '../models/cart_item_model.dart';

class CartState {
  final List<CartItemModel> items;

  const CartState({
    this.items = const [],
  });

  CartState copyWith({
    List<CartItemModel>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }

  double get totalPrice {
    return items.fold(
      0,
          (total, item) => total + (item.price * item.quantity),
    );
  }

  int get totalItems {
    return items.fold(
      0,
          (total, item) => total + item.quantity,
    );
  }
}