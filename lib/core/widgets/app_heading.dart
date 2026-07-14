import 'package:flutter/material.dart';

import '../theme/app_textstyles.dart';

class AppHeading extends StatelessWidget {

  final String title;
  final String subtitle;

  const AppHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Text(
          title,
          style: AppTextStyles.heading2,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        Text(
          subtitle,
          style: AppTextStyles.bodySecondary,
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}