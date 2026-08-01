import 'package:shop_easy/core/constants/app_categories.dart';

import '../core/constants/app_images.dart';
import '../features/product/data/models/product_model.dart';

class SampleProducts {
  static final List<ProductModel> products = [

    // ================= Shoes =================

    ProductModel(
      id: "nike_air_max",
      name: "Nike Air Max",
      description: "Premium running shoes with maximum comfort.",
      price: 2999,
      imageUrl: AppImages.nikeAirMax,
      rating: 4.6,
      discount: 20,
      category: AppCategories.shoes,
      stock: 15,
    ),

    ProductModel(
      id: "adidas_ultraboost",
      name: "Adidas Ultraboost",
      description: "Comfortable shoes for everyday running.",
      price: 4999,
      imageUrl: AppImages.adidasUltraBoost,
      rating: 4.7,
      discount: 15,
      category: AppCategories.shoes,
      stock: 12,
    ),

    ProductModel(
      id: "puma_runner",
      name: "Puma Runner",
      description: "Lightweight sports shoes.",
      price: 3499,
      imageUrl: AppImages.pumaRunner,
      rating: 4.4,
      discount: 18,
      category: AppCategories.shoes,
      stock: 10,
    ),

    // ================= Mobiles =================

    ProductModel(
      id: "iphone_16",
      name: "iPhone 16",
      description: "Apple's latest flagship smartphone.",
      price: 79999,
      imageUrl: AppImages.iphone16,
      rating: 4.9,
      discount: 5,
      category: AppCategories.mobiles,
      stock: 8,
    ),

    ProductModel(
      id: "samsung_s26",
      name: "Samsung Galaxy S26",
      description: "Latest Samsung flagship phone.",
      price: 74999,
      imageUrl: AppImages.samsungS26,
      rating: 4.8,
      discount: 8,
      category: AppCategories.mobiles,
      stock: 10,
    ),

    ProductModel(
      id: "google_pixel_10",
      name: "Google Pixel 10",
      description: "Pure Android experience.",
      price: 65999,
      imageUrl: AppImages.pixel10,
      rating: 4.7,
      discount: 10,
      category: AppCategories.mobiles,
      stock: 7,
    ),

    // ================= Laptops =================

    ProductModel(
      id: "hp_victus",
      name: "HP Victus",
      description: "Gaming laptop with RTX graphics.",
      price: 69999,
      imageUrl: AppImages.hpVictus,
      rating: 4.7,
      discount: 10,
      category: AppCategories.laptops,
      stock: 5,
    ),

    ProductModel(
      id: "dell_inspiron",
      name: "Dell Inspiron",
      description: "Perfect laptop for office and study.",
      price: 55999,
      imageUrl: AppImages.dellInspiron,
      rating: 4.5,
      discount: 12,
      category: AppCategories.laptops,
      stock: 9,
    ),

    ProductModel(
      id: "macbook_air_m4",
      name: "MacBook Air M4",
      description: "Apple's lightweight performance laptop.",
      price: 114999,
      imageUrl: AppImages.macbookAir,
      rating: 4.9,
      discount: 4,
      category:AppCategories.laptops,
      stock: 4,
    ),

    // ================= Audio =================

    ProductModel(
      id: "boat_airdopes",
      name: "Boat Airdopes",
      description: "Wireless earbuds with deep bass.",
      price: 1999,
      imageUrl: AppImages.boatAirdopes,
      rating: 4.3,
      discount: 30,
      category: AppCategories.audio,
      stock: 20,
    ),

    ProductModel(
      id: "sony_wh1000xm5",
      name: "Sony WH-1000XM5",
      description: "Premium noise cancelling headphones.",
      price: 24999,
      imageUrl: AppImages.sonyXm5,
      rating: 4.9,
      discount: 18,
      category:AppCategories.audio,
      stock: 7,
    ),

    ProductModel(
      id: "jbl_flip_7",
      name: "JBL Flip 7",
      description: "Portable Bluetooth speaker.",
      price: 8999,
      imageUrl: AppImages.jblFlip,
      rating: 4.6,
      discount: 12,
      category: AppCategories.audio,
      stock: 11,
    ),

    // ================= Accessories =================

    ProductModel(
      id: "apple_watch_series_11",
      name: "Apple Watch Series 11",
      description: "Premium smartwatch.",
      price: 45999,
      imageUrl: AppImages.appleWatch,
      rating: 4.8,
      discount: 6,
      category: AppCategories.accessories,
      stock: 9,
    ),

    ProductModel(
      id: "logitech_mx_master_3s",
      name: "Logitech MX Master 3S",
      description: "Professional wireless mouse.",
      price: 8999,
      imageUrl: AppImages.logitechMouse,
      rating: 4.9,
      discount: 10,
      category:AppCategories.accessories,
      stock: 16,
    ),

    ProductModel(
      id: "keychron_k2",
      name: "Keychron K2",
      description: "Wireless mechanical keyboard.",
      price: 7499,
      imageUrl: AppImages.keychronK2,
      rating: 4.8,
      discount: 15,
      category: AppCategories.accessories,
      stock: 13,
    ),
  ];
}