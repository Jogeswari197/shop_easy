import '../../cart/presentation/models/cart_item_model.dart';
import '../data/models/product_model.dart';

extension ProductMapper on ProductModel {

  CartItemModel toCartItem() {
    return CartItemModel(
      id: id,
      name: name,
      imageUrl: imageUrl,
      price: price,
      quantity: 1,
    );
  }

}