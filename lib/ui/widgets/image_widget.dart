import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/assets/images.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  final String? imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: imagePath != null
          ? CachedNetworkImage(
              width: width,
              height: height,
              fit: BoxFit.cover,
              imageUrl: imagePath!,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                AppImages.noImage,
              ),
            )
          : Image.asset(
              AppImages.noImage,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
    );
  }
}
