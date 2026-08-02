import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(
        AppRadius.full,
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(
          AppRadius.full,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.sm,
          ),
          child: Icon(
            isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
            size: 20,
          ),
        ),
      ),
    );
  }
}