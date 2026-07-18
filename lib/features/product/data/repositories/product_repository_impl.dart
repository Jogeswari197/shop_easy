import '../../../home/presentation/models/product_model.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_source/product_remote_data_source.dart';

class ProductRepositoryImpl
    implements ProductRepository {

  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(
      this.remoteDataSource,
      );

  @override
  Future<ProductModel> getProduct(
      String productId,
      ) async {

    return remoteDataSource.getProduct(
      productId,
    );
  }
}