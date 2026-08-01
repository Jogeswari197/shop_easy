import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_easy/dev_tools/sample_products.dart';

import '../features/product/data/models/product_model.dart';

class ProductSeeder {
  static Future<void> seedProducts() async {
    final firestore = FirebaseFirestore.instance;

    // final products = <ProductModel>[
    //   ProductModel(
    //     id: "nike_air_max",
    //     name: "Nike Air Max",
    //     description:
    //     "Premium running shoes with lightweight cushioning and excellent comfort.",
    //     price: 2999,
    //     imageUrl: "",
    //     rating: 4.5,
    //     discount: 20,
    //     category: "Shoes",
    //     stock: 15,
    //   ),
    //
    //   ProductModel(
    //     id: "adidas_ultraboost",
    //     name: "Adidas Ultraboost",
    //     description: "Comfortable running shoes for everyday use.",
    //     price: 4999,
    //     imageUrl: "",
    //     rating: 4.6,
    //     discount: 15,
    //     category: "Shoes",
    //     stock: 12,
    //   ),
    //
    //   ProductModel(
    //     id: "iphone_16",
    //     name: "iPhone 16",
    //     description: "Apple's latest flagship smartphone.",
    //     price: 79999,
    //     imageUrl: "",
    //     rating: 4.9,
    //     discount: 5,
    //     category: "Mobiles",
    //     stock: 8,
    //   ),
    //
    //   ProductModel(
    //     id: "samsung_s26",
    //     name: "Samsung Galaxy S26",
    //     description: "Latest Samsung flagship phone.",
    //     price: 74999,
    //     imageUrl: "",
    //     rating: 4.8,
    //     discount: 8,
    //     category: "Mobiles",
    //     stock: 10,
    //   ),
    //
    //   ProductModel(
    //     id: "hp_victus",
    //     name: "HP Victus",
    //     description: "Gaming laptop with RTX graphics.",
    //     price: 69999,
    //     imageUrl: "",
    //     rating: 4.7,
    //     discount: 10,
    //     category: "Laptops",
    //     stock: 5,
    //   ),
    //
    //   ProductModel(
    //     id: "dell_inspiron",
    //     name: "Dell Inspiron",
    //     description: "Powerful laptop for work and study.",
    //     price: 55999,
    //     imageUrl: "",
    //     rating: 4.4,
    //     discount: 12,
    //     category: "Laptops",
    //     stock: 9,
    //   ),
    //
    //   ProductModel(
    //     id: "boat_airdopes",
    //     name: "Boat Airdopes",
    //     description: "Wireless Bluetooth earbuds.",
    //     price: 1999,
    //     imageUrl: "",
    //     rating: 4.3,
    //     discount: 30,
    //     category: "Audio",
    //     stock: 20,
    //   ),
    //
    //   ProductModel(
    //     id: "sony_headphones",
    //     name: "Sony WH-1000XM5",
    //     description: "Premium noise cancelling headphones.",
    //     price: 24999,
    //     imageUrl: "",
    //     rating: 4.9,
    //     discount: 18,
    //     category: "Audio",
    //     stock: 7,
    //   ),
    // ];

    final products = SampleProducts.products;
    
    final batch = firestore.batch();

    for (final product in products) {
      final docRef = firestore
          .collection("products")
          .doc(product.id);

      final json = product.toJson();

      json.remove("id");

      batch.set(
        docRef,
        json,
      );
    }

    await batch.commit();
  }
}