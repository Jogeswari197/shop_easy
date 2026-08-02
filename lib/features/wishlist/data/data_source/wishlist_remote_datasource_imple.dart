import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_easy/features/product/data/models/product_model.dart';
import 'package:shop_easy/features/wishlist/data/data_source/wishlist_remote_datasource.dart';

class WishlistRemoteDataSourceImpl
    implements WishlistRemoteDataSource {

  final FirebaseFirestore _firestore;

  WishlistRemoteDataSourceImpl(
      this._firestore,
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