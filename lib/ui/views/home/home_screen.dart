import 'package:flutter/material.dart';

import 'package:anime_vault/ui/views/home/top_anime.dart';
import 'package:anime_vault/ui/views/home/anime_list.dart';
import 'package:anime_vault/ui/widgets/screen_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentScreen: 'home',
      body: Column(
        children: [
          TopAnime(),
          AnimeList(),
          SizedBox(),
        ],
      ),
    );
  }
}
