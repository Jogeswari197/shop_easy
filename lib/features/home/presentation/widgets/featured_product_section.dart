import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../models/product_model.dart';
import 'product_card.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {

    const products = [

      const ProductModel(
        id: "1",
        name: "Nike Shoes",
        price: 2999,
        imageUrl: "",
        rating: 4.5,
        description:
        "Premium running shoes with lightweight cushioning and excellent comfort.",
        discount: 20,
        isFavorite: true,
      ),

      ProductModel(
        id: "2",
        name: "iPhone 16",
        price: 79999,
        imageUrl: "",
        rating: 4.9,
        description:
        "Premium running shoes with lightweight cushioning and excellent comfort.",
        discount: 20,
        isFavorite: true,
      ),

      ProductModel(
        id: "3",
        name: "Laptop",
        price: 55999,
        imageUrl: "",
        rating: 4.6,
        description:
        "Premium running shoes with lightweight cushioning and excellent comfort.",
        discount: 20,
        isFavorite: false,
      ),

      ProductModel(
        id: "4",
        name: "Headphones",
        price: 3499,
        imageUrl: "",
        rating: 4.4,
        description:
        "Premium running shoes with lightweight cushioning and excellent comfort.",
        discount: 20,
        isFavorite: true,
      ),

    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Featured Products",
          style: AppTextStyles.title,
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: products.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 0.60,
          ),

          itemBuilder: (context, index) {

            return ProductCard(
              product: products[index],
            );

          },
        ),
      ],
    );
  }
}