class Genre {
  final String id;
  final String type;
  final String name;
  final String url;

  Genre({
    required this.id,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
