import 'package:flutter/material.dart';

import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/src/services/repositories/anime_repository.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getTopAnime();
    getAnimeList();
  }
  List<AnimeModel> topAnime = [];
  List<AnimeModel> animeList = [];

  final AnimeRepository _animeRepo = AnimeRepository();

  void getTopAnime() async {
    topAnime = await _animeRepo.getTopAnime();

    notifyListeners();
  }

  void getAnimeList() async {
    animeList = await _animeRepo.getAnimeList();

    notifyListeners();
  }
}
