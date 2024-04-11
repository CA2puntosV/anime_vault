import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/widgets/star_rating.dart';
import 'package:anime_vault/ui/widgets/image_widget.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:anime_vault/src/models/anime_pictures.dart';
import 'package:anime_vault/src/providers/details_provider.dart';

class DetailsAnimeInfo extends StatelessWidget {
  const DetailsAnimeInfo({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: screen.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   anime.title,
              //   style: AppTextStyles.title,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 2,
              // ),
              // 8.0.spaceV,
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

              const Text('Read more'),
              10.0.spaceV,

              SizedBox(
                height: 130,
                child: Selector<DetailsProvider, List<AnimePictures>>(
                  selector: (_, bloc) => bloc.animePictures,
                  builder: (_, images, __) => images.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (_, index) => Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ImageWidget(
                                    imagePath: images[index].image,
                                    width: 100,
                                    height: 130,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
