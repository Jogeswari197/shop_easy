import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/presentation/models/product_model.dart';
import '../../data/data_source/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';

final productRemoteDataSourceProvider =
Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSource();
});

final productRepositoryProvider =
Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    ref.read(productRemoteDataSourceProvider),
  );
});

final productProvider =
FutureProvider.family<ProductModel, String>(
      (ref, productId) async {
    return ref
        .read(productRepositoryProvider)
        .getProduct(productId);
  },
);