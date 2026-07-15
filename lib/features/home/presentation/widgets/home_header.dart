import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "👋 Hello!",
          style: AppTextStyles.heading2,
        ),

        SizedBox(
          height: AppSpacing.sm,
        ),

        Text(
          "Welcome to ShopEasy",
          style: AppTextStyles.bodySecondary,
        ),

      ],
    );
  }
}