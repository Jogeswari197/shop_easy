import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_product_image.dart';
import '../../../../core/widgets/favourite_button.dart';
import '../../data/models/product_model.dart';

class ProductImageSection extends StatelessWidget {
  final ProductModel product;

  const ProductImageSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.15,
      child: Stack(
        children: [

          Container(
            padding: const EdgeInsets.all(
              AppSpacing.md,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(
                AppRadius.md,
              ),
            ),
            child: AppProductImage(
              image: product.imageUrl,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: AppSpacing.sm,
            left: AppSpacing.sm,
            child: FavoriteButton(
              isFavorite: false,
              onPressed: () {},
            ),
          ),

          if (product.discount > 0)
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.sm,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.discount,
                  borderRadius: BorderRadius.circular(
                    AppRadius.full,
                  ),
                ),
                child: Text(
                  "-${product.discount}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}