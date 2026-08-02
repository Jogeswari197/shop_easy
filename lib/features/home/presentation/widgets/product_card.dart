import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../../../../core/utils/price_utils.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_product_image.dart';
import '../../../../core/widgets/favourite_button.dart';
import '../../../../core/widgets/rating_chip.dart';
import '../../../product/data/models/product_model.dart';
import '../../../product/presenation/widgets/product_image_section.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final originalPrice = PriceUtils.getOriginalPrice(
      price: product.price,
      discount: product.discount,
    );
    return InkWell(
      onTap: (){
        context.push(
          '/product/${product.id}',
        );
      },
      child: Card(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.lg,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              // Image Placeholder
              ProductImageSection(
                product: product,
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body,
              ),

              const SizedBox(
                height: AppSpacing.xs,
              ),

              Row(
                children: [

                  Text(
                    "₹${product.price.toStringAsFixed(0)}",
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(width: AppSpacing.xs),

                  if (product.discount > 0)
                    Expanded(
                      child: Text(
                        "₹${originalPrice.toStringAsFixed(0)}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySecondary.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.xs,
              ),

              RatingChip(
                rating: product.rating,
              ),





            ],
          ),
        ),
      ),
    );
  }
}