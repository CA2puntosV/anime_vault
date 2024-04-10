import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/router/router_path.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    super.key,
    required this.height,
    required this.width,
    required this.animeModel,
    this.margin,
  });

  final double height;
  final double width;
  final AnimeModel animeModel;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${animeModel.id}',
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouterPath.details,
            arguments: {'anime': animeModel},
          );
        },
        child: Container(
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
            color: AppColors.empty,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: _Image(animeModel: animeModel),
              ),
              Positioned(
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${animeModel.rank}',
                    style: AppTextStyles.rank,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(AppIcons.bookmarkOutline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.animeModel,
  });

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: animeModel.largeImageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
