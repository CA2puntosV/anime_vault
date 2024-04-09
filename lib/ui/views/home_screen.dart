import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/src/providers/home_provider.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/app_strings.dart';
import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/widgets/title_widget.dart';
import 'package:anime_vault/ui/widgets/wide_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: TitleWidget(
                  text: AppStrings.topFive,
                ),
              ),
              _TopAnime(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopAnime extends StatelessWidget {
  const _TopAnime();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 300,
      // color: Colors.red,
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
    );
  }
}
