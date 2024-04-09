import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/widgets/wide_card.dart';
import 'package:anime_vault/ui/shared/app_strings.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/widgets/title_widget.dart';
import 'package:anime_vault/src/providers/home_provider.dart';

class TopAnime extends StatelessWidget {
  const TopAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        33.0.spaceV,
        const Padding(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: TitleWidget(
            text: AppStrings.topFive,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          height: 275,
          child: Selector<HomeProvider, List<AnimeModel>>(
            selector: (_, bloc) => bloc.topAnime,
            builder: (_, list, __) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (_, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WideCard(
                      animeModel: list[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
