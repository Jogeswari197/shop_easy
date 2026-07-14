import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_textstyles.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 90});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          height: size,
          width: size,

          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),

          child: const Icon(
            Icons.shopping_bag_rounded,
            color: Colors.white,
            size: 45,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          "ShopEasy",
          style: AppTextStyles.heading1,
        ),

      ],
    );
  }
}