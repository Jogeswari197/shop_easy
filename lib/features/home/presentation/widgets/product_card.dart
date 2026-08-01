import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_product_image.dart';
import '../../../product/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("Product: ${product.name}");
    debugPrint("Image: ${product.imageUrl}");
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
              Expanded(
                child: Stack(
                  children: [

                    SizedBox(
                      height: 120,
                      width: double.infinity,

                      child: product.imageUrl.isEmpty
                          ? Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                          BorderRadius.circular(
                            AppRadius.md,
                          ),
                        ),
                        child: const Icon(
                          Icons.image_outlined,
                          size: 45,
                        ),
                      )

                          : AppProductImage(
                        image: product.imageUrl,
                        height: 120,
                        width: double.infinity,
                      )
                    ),


                    // Positioned(
                    //   top: 8,
                    //   left: 8,
                    //
                    //   child: CircleAvatar(
                    //     radius: 16,
                    //     backgroundColor: Colors.white,
                    //
                    //     child: Icon(
                    //       product.isFavorite
                    //           ? Icons.favorite
                    //           : Icons.favorite_border,
                    //       color: Colors.red,
                    //       size: 18,
                    //     ),
                    //   ),
                    // ),

                    if (product.discount > 0)

                      Positioned(
                        top: 8,
                        right: 8,

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                            BorderRadius.circular(20),
                          ),

                          child: Text(
                            "-${product.discount}%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body,
              ),

              const SizedBox(
                height: AppSpacing.xs,
              ),

              Text(
                "₹${product.price.toStringAsFixed(0)}",
                style: AppTextStyles.title.copyWith(
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(
                height: AppSpacing.xs,
              ),

              Row(
                children: [

                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    product.rating.toString(),
                    style: AppTextStyles.bodySecondary,
                  ),

                ],
              ),

              // const SizedBox(
              //   height: AppSpacing.md,
              // ),

              // SizedBox(
              //   width: double.infinity,
              //   height: 35,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //
              //     child: const Text(
              //       "Add to Cart",
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}