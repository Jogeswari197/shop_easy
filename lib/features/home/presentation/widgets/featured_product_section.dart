import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../../../product/data/models/product_model.dart';
import 'product_card.dart';

class FeaturedProductsSection extends StatelessWidget {
  final List<ProductModel> products;
  const FeaturedProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {


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

        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount =
            constraints.maxWidth > 600 ? 3 : 2;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: products.length,

              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                childAspectRatio: 0.60,
              ),

              itemBuilder: (context, index) {

                return ProductCard(
                  product: products[index],
                );

              },
            );
          }
        ),
      ],
    );
  }
}