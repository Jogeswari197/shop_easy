
import '../../../home/presentation/models/product_model.dart';

abstract class ProductRepository {
  Future<ProductModel> getProduct(String productId);
}