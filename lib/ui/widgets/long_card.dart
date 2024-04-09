import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/widgets/anime_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  const LongCard({
    super.key,
    required this.animeModel,
  });

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimeCard(
          width: 182,
          height: 273,
          margin: const EdgeInsets.only(bottom: 20),
          animeModel: animeModel,
        ),
        14.0.spaceH,
        _AnimeInfo(
          animeModel: animeModel,
        ),
        4.0.spaceH,
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
    return Expanded(
      child: SizedBox(
        height: 273,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              animeModel.title,
              style: AppTextStyles.subtitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            8.0.spaceV,
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
            ),
            8.0.spaceV,
            Wrap(
              children: animeModel.genres.map((genre) {
                int index = animeModel.genres.indexOf(genre);

                if (index == animeModel.genres.length - 1) {
                  return Text(
                    genre.name,
                    style: AppTextStyles.smallbold,
                    overflow: TextOverflow.ellipsis,
                  );
                }

                return Text(
                  '${genre.name}, ',
                  style: AppTextStyles.smallbold,
                );
              }).toList(),
            ),
            8.0.spaceV,
            Text(
              '${animeModel.synopsis}, ',
              style: AppTextStyles.synopsis,
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
            ),
          ],
        ),
      ),
    );
  }
}
