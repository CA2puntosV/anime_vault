
import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/widgets/star_rating.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  //todo if is readmore load screen without stack

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Hero(
            tag: '${anime.id}',
            child: SizedBox(
              height: screen.height * 0.65,
              child: Image.network(
                anime.largeImageUrl,
                fit: BoxFit.cover,
                width: screen.width,
              ),
            ),
          ),
          const _Gradient(),
          _AnimeInfo(
            anime: anime,
          ),
        ],
      ),
    );
  }
}

class _Gradient extends StatelessWidget {
  const _Gradient();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.62,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0, 0.3, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(17, 17, 17, 0),
              Color(0xff111111),
              Color(0xff111111)
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimeInfo extends StatelessWidget {
  const _AnimeInfo({
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: screen.height * 0.57,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                anime.title,
                style: AppTextStyles.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              8.0.spaceV,
              //TODO make n global widget
              Row(
                children: [
                  //TODO remove weight
                  //TODO if num in left is 0 remove it
                  Text(
                    '${anime.score}',
                    style: AppTextStyles.subtitle,
                  ),
                  9.0.spaceH,
                  StarRating(
                    rating: anime.score,
                  ),
                ],
              ),
              8.0.spaceV,
              Wrap(
                children: anime.genres.map((genre) {
                  int index = anime.genres.indexOf(genre);

                  if (index == anime.genres.length - 1) {
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
                anime.synopsis,
                style: AppTextStyles.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),

              Text('Read more'),
              8.0.spaceV,
            ],
          ),
        ),
      ),
    );
  }
}
