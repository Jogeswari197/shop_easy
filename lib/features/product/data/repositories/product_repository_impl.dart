import '../../domain/repositories/product_repository.dart';
import '../data_source/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl
    implements ProductRepository {

  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(
      this.remoteDataSource,
      );

  @override
  Future<List<ProductModel>> getProducts() {
    return remoteDataSource.getProducts();
  }

  @override
  Future<ProductModel> getProduct(
      String productId,
      ) {
    return remoteDataSource.getProduct(
      productId,
    );
  }
}