import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/views/home/top_anime.dart';
import 'package:anime_vault/ui/views/home/anime_list.dart';
import 'package:anime_vault/ui/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _Body(),
          Positioned(
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  const TopAnime(),
                  const AnimeList(),
                  const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
