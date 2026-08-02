import '../../../product/data/models/product_model.dart';

abstract class WishlistRepository {

  Future<List<ProductModel>> getWishlist();

  Future<void> addToWishlist(
      String productId,
      );

  Future<void> removeFromWishlist(
      String productId,
      );

  Future<bool> isFavorite(
      String productId,
      );

}