import '../../presentation/models/cart_item_model.dart';

abstract class CartRepository {

  List<CartItemModel> getCartItems();

  void addToCart(CartItemModel item);

  void removeFromCart(String productId);

  void increaseQuantity(String productId);

  void decreaseQuantity(String productId);

  void clearCart();

}