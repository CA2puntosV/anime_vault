import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/widgets/anime_card.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';

class WideCard extends StatelessWidget {
  const WideCard({
    super.key,
    required this.animeModel,
  });

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimeCard(
          width: 300,
          height: 200,
          margin: const EdgeInsets.only(right: 20),
          animeModel: animeModel,
        ),
        10.0.spaceV,
        _AnimeInfo(
          animeModel: animeModel,
        ),
      ],
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
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            animeModel.title,
            style: AppTextStyles.subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          4.0.spaceV,
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
      ),
    );
  }
}
