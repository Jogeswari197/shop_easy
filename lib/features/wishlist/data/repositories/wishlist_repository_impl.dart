import 'package:shop_easy/features/product/data/models/product_model.dart';

import '../../domain/repositories/wishlist_repository.dart';
import '../data_source/wishlist_remote_datasource.dart';

class WishlistRepositoryImpl
    implements WishlistRepository {

  final WishlistRemoteDataSource _remoteDataSource;

  WishlistRepositoryImpl(
      this._remoteDataSource,
      );

  @override
  Future<void> addToWishlist(String productId) {
    // TODO: implement addToWishlist
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getWishlist() {
    // TODO: implement getWishlist
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavorite(String productId) {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromWishlist(String productId) {
    // TODO: implement removeFromWishlist
    throw UnimplementedError();
  }

}