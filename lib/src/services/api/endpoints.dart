class Endpoints {
  static const String topAnime = 'https://api.jikan.moe/v4/top/anime?limit=5';
  static const String animeList = 'https://api.jikan.moe/v4/anime?limit=15';

  static String animePictures(int animeId) {
    return 'https://api.jikan.moe/v4/anime/$animeId/pictures';
  }
}
