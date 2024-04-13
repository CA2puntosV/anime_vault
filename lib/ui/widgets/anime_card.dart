import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/router/router_path.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:anime_vault/ui/widgets/image_widget.dart';
import 'package:anime_vault/ui/shared/app_text_styles.dart';

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
        onTap: () => Navigator.pushNamed(
          context,
          RouterPath.details,
          arguments: {'anime': animeModel},
        ),
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
                child: ImageWidget(
                  imagePath: animeModel.largeImageUrl,
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  margin: const EdgeInsets.all(5),
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primary,
                  ),
                  child: Center(
                    child: Text(
                      '${animeModel.rank}',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.smallbold,
                    ),
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
