import 'package:flutter/material.dart';

import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/src/services/repositories/anime_repository.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getTopAnime();
    getAnimeList();
  }
  final AnimeRepository _animeRepo = AnimeRepository();

  List<AnimeModel> topAnime = [];
  List<AnimeModel> animeList = [];

  void getTopAnime() async {
    topAnime = await _animeRepo.getTopAnime();

    notifyListeners();
  }

  void getAnimeList() async {
    animeList = await _animeRepo.getAnimeList();

    notifyListeners();
  }

  Widget fillStars(double rating) {
    List<Widget> stars = [];

    int wholeStars = rating.floor();

    for (int i = 0; i < wholeStars; i++) {
      stars.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    }

    if (rating - wholeStars >= 0.5) {
      stars.add(
        const Icon(
          Icons.star_half,
          color: Colors.yellow,
        ),
      );
      wholeStars++;
    }
    for (int i = wholeStars; i < 5; i++) {
      stars.add(
        const Icon(
          Icons.star_border,
          color: Colors.yellow,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
