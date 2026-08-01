import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_radius.dart';
import 'loading_widgets.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      borderRadius ??
          BorderRadius.circular(AppRadius.md),

      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,

        placeholder: (context, url) {
          return SizedBox(
            width: width,
            height: height,
            child: const LoadingWidget(),
          );
        },

        errorWidget: (context, url, error) {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }
}