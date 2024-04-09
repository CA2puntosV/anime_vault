import 'package:anime_vault/src/models/genre_model.dart';
import 'package:anime_vault/src/models/title_model.dart';

class AnimeModel {
  final int id;
  final String url;
  final Map<String, dynamic> images;
  final String title;
  final List<Title> titles;
  final List<Genre> genres;
  final int chapters;
  final String status;
  final double score;
  final int rank;
  final String synopsis;

  AnimeModel({
    required this.id,
    required this.url,
    required this.images,
    required this.title,
    required this.titles,
    required this.genres,
    required this.chapters,
    required this.status,
    required this.score,
    required this.rank,
    required this.synopsis,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    final List<Title> titles = (json['titles'] as List? ?? [])
        .map((title) => Title.fromJson(title))
        .toList();
        
    final List<Genre> genres = (json['genres'] as List? ?? [])
        .map((genre) => Genre.fromJson(genre))
        .toList();

    return AnimeModel(
      id: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      images: json['images']['jpg'] ?? {},
      title: json['title'] ?? '',
      titles: titles,
      genres: genres,
      chapters: json['chapters'] ?? 0,
      status: json['status'] ?? '',
      score: json['score'] ?? 0.0,
      rank: json['rank'] ?? 0,
      synopsis: json['synopsis'] ?? '',
    );
  }

  String get imageUrl => images['image_url'];
  String get smallImageUrl => images['small_image_url'];
  String get largeImageUrl => images['large_image_url'];
}
