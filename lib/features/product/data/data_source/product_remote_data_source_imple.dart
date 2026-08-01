import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_easy/features/product/data/data_source/product_remote_data_source.dart';

import '../../data/models/product_model.dart';

class ProductRemoteDataSourceImpl
    implements ProductRemoteDataSource {

  final FirebaseFirestore _firestore;

  ProductRemoteDataSourceImpl(
      this._firestore,
      );

  @override
  Future<List<ProductModel>> getProducts() async {

    final snapshot =
    await _firestore
        .collection("products")
        .get();

    return snapshot.docs.map((doc) {

      return ProductModel.fromFirestore(
        doc.id,
        doc.data(),
      );

    }).toList();

  }

  @override
  Future<ProductModel> getProduct(
      String productId,
      ) async {

    final doc =
    await _firestore
        .collection("products")
        .doc(productId)
        .get();

    if (!doc.exists) {
      throw Exception("Product not found");
    }

    return ProductModel.fromFirestore(
      doc.id,
      doc.data()!,
    );

  }

}