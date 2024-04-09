import 'package:flutter/material.dart';

import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/src/services/repositories/anime_repository.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getTopAnime();
  }
  List<AnimeModel> topAnime = [];

  final AnimeRepository _animeRepo = AnimeRepository();

  void getTopAnime() async {
    topAnime = await _animeRepo.getTopAnime();

    notifyListeners();
  }
}
