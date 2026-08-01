import '../../domain/repositories/cart_repository.dart';
import '../../presentation/models/cart_item_model.dart';
import '../data_source/cart_local_data_source.dart';

class CartRepositoryImpl implements CartRepository {

  final CartLocalDataSource localDataSource;

  CartRepositoryImpl(
      this.localDataSource,
      );

  @override
  List<CartItemModel> getCartItems() {
    return localDataSource.getCartItems();
  }

  @override
  void addToCart(CartItemModel item) {
    localDataSource.addToCart(item);
  }

  @override
  void removeFromCart(String productId) {
    localDataSource.removeFromCart(productId);
  }

  @override
  void clearCart() {
    localDataSource.clearCart();
  }

  @override
  void increaseQuantity(String productId) {
    localDataSource.increaseQuantity(productId);
  }

  @override
  void decreaseQuantity(String productId) {
    localDataSource.decreaseQuantity(productId);
  }

}