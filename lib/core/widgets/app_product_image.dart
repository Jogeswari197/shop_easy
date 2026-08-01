import 'package:flutter/material.dart';

import '../theme/app_radius.dart';

class AppProductImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppProductImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      borderRadius ??
          BorderRadius.circular(
            AppRadius.md,
          ),
      child: Image.asset(
        image,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}