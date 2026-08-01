import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/product_remote_data_source_imple.dart';
import '../../data/models/product_model.dart';
import '../../data/data_source/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';




final productProvider =
FutureProvider.family<ProductModel, String>(
      (ref, productId) async {
    return ref
        .read(productRepositoryProvider)
        .getProduct(productId);
  },
);

final firestoreProvider =
Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});


final productRemoteDataSourceProvider =
Provider<ProductRemoteDataSource>((ref) {

  return ProductRemoteDataSourceImpl(
    ref.read(firestoreProvider),
  );

});

final productRepositoryProvider =
Provider<ProductRepository>((ref) {

  return ProductRepositoryImpl(
    ref.read(productRemoteDataSourceProvider),
  );

});

final productsProvider =
FutureProvider<List<ProductModel>>((ref) async {

  return ref
      .read(productRepositoryProvider)
      .getProducts();

});