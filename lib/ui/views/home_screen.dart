import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/app_strings.dart';
import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/widgets/title_widget.dart';
import 'package:anime_vault/ui/widgets/wide_card.dart';
import 'package:flutter/material.dart';

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
      height: 300,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.0.spaceH,
              const WideCard(),
              const WideCard(),
            ],
          );
        },
      ),
    );
  }
}
