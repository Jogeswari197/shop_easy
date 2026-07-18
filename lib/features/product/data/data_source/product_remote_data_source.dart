
import '../../../home/presentation/models/product_model.dart';

class ProductRemoteDataSource {

  Future<ProductModel> getProduct(String productId) async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return ProductModel(
      id: productId,
      name: "Nike Air Max",
      price: 2999,
      imageUrl: "",
      rating: 4.5,
      description:
      "Premium running shoes with lightweight cushioning and excellent comfort.",
      discount: 20,
      isFavorite: true,
    );
  }
}