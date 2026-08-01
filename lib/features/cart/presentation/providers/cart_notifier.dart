import 'package:flutter_riverpod/legacy.dart';

import '../../domain/repositories/cart_repository.dart';
import '../models/cart_item_model.dart';
import 'cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {

  final CartRepository _repository;

  CartNotifier(this._repository)
      : super(const CartState());

  void loadCart() {

    state = state.copyWith(
      items: _repository.getCartItems(),
    );

  }

  void addToCart(CartItemModel item) {

    _repository.addToCart(item);

    loadCart();

  }

  void increaseQuantity(String productId) {

    _repository.increaseQuantity(productId);

    loadCart();

  }


  void decreaseQuantity(String productId) {

    _repository.decreaseQuantity(productId);

    loadCart();

  }


  void removeItem(String productId) {

    _repository.removeFromCart(productId);

    loadCart();

  }


  void clearCart() {

    _repository.clearCart();

    loadCart();

  }

}