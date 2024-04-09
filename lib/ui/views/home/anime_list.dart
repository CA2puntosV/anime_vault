import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/widgets/long_card.dart';
import 'package:anime_vault/ui/shared/app_strings.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/widgets/title_widget.dart';
import 'package:anime_vault/src/providers/home_provider.dart';
import 'package:anime_vault/ui/widgets/custom_text_button.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.0.spaceV,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: TitleWidget(
                text: AppStrings.animeList,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: CustomTextButton(
                label: AppStrings.seeMore.toUpperCase(),
                func: () {},
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          width: 380,
          child: Selector<HomeProvider, List<AnimeModel>>(
            selector: (_, bloc) => bloc.animeList,
            builder: (_, list, __) => Column(
              children: List.generate(
                list.length,
                (index) => LongCard(
                  animeModel: list[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
