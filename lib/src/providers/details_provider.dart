import 'package:anime_vault/src/services/repositories/anime_repository.dart';
import 'package:flutter/material.dart';

import 'package:anime_vault/src/models/anime_pictures.dart';

class DetailsProvider extends ChangeNotifier {
  final AnimeRepository _animeRepo = AnimeRepository();

  List<AnimePictures> animePictures = [];

  void getAnimePictures(int animeId) async {
    //TODO persistencia, para no generar muchas consultas
    animePictures = await _animeRepo.getAnimePictures(animeId);
    notifyListeners();
  }
}
