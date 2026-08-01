import '../../presentation/models/cart_item_model.dart';

class CartLocalDataSource {

  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> getCartItems() {
    return List.unmodifiable(_cartItems);
  }

  void addToCart(CartItemModel item) {

    final index = _cartItems.indexWhere(
          (cartItem) => cartItem.id == item.id,
    );

    if (index != -1) {

      final existingItem = _cartItems[index];

      _cartItems[index] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );

    } else {

      _cartItems.add(item);

    }

  }

  void increaseQuantity(String productId) {

    final index = _cartItems.indexWhere(
          (item) => item.id == productId,
    );

    if (index == -1) return;

    final item = _cartItems[index];

    _cartItems[index] = item.copyWith(
      quantity: item.quantity + 1,
    );

  }

  void decreaseQuantity(String productId) {

    final index = _cartItems.indexWhere(
          (item) => item.id == productId,
    );

    if (index == -1) return;

    final item = _cartItems[index];

    if (item.quantity == 1) {

      _cartItems.removeAt(index);

    } else {

      _cartItems[index] = item.copyWith(
        quantity: item.quantity - 1,
      );

    }

  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere(
          (item) => item.id == productId,
    );
  }

  void clearCart() {
    _cartItems.clear();
  }

}