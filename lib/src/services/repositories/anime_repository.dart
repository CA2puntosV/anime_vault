import 'dart:convert';

import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/src/models/anime_pictures.dart';
import 'package:anime_vault/src/services/api/api_helper.dart';
import 'package:anime_vault/src/services/api/endpoints.dart';

class AnimeRepository {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<AnimeModel>> getTopAnime() async {
    try {
      final List<AnimeModel> topAnime = [];

      final response = await _apiHelper.get(
        path: Endpoints.topAnime,
      );

      final jsonData = json.decode(response.body);

      if (response.body.isNotEmpty) {
        for (final animes in jsonData['data']) {
          topAnime.add(AnimeModel.fromJson(animes));
        }
      }

      return topAnime;
    } catch (e) {
      return [];
    }
  }

  Future<List<AnimeModel>> getAnimeList() async {
    try {
      final List<AnimeModel> animeList = [];

      final response = await _apiHelper.get(
        path: Endpoints.animeList,
      );

      final jsonData = json.decode(response.body);

      if (response.body.isNotEmpty) {
        for (final animes in jsonData['data']) {
          animeList.add(AnimeModel.fromJson(animes));
        }
      }

      return animeList;
    } catch (e) {
      return [];
    }
  }

  Future<List<AnimePictures>> getAnimePictures(int animeId) async {
    try {
      final List<AnimePictures> animePictures = [];

      final response = await _apiHelper.get(
        path: Endpoints.animePictures(animeId),
      );

      final jsonData = json.decode(response.body);

      if (response.body.isNotEmpty) {
        for (final animes in jsonData['data']) {
          animePictures.add(AnimePictures.fromJson(animes));
        }
      }

      return animePictures;
    } catch (e) {
      return [];
    }
  }
}
