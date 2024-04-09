import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WideCard extends StatelessWidget {
  const WideCard({
    super.key,
    required this.animeModel,
  });

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Card(
          animeModel: animeModel,
        ),
        12.0.spaceV,
        _AnimeInfo(
          animeModel: animeModel,
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.animeModel,
  });

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 300,
      height: 200,
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
    );
  }
}

class _AnimeInfo extends StatelessWidget {
  const _AnimeInfo({
    required this.animeModel,
  });

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          animeModel.title,
          style: AppTextStyles.subtitle,
        ),
        Row(
          children: [
            //TODO remove weight
            //TODO if num in left is 0 remove it
            Text(
              '${animeModel.score}',
              style: AppTextStyles.subtitle,
            ),
            9.0.spaceH,
            //TODO stars
          ],
        )
      ],
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
