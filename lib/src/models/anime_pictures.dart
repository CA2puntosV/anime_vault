class AnimePictures {
  String? image;
  String? smallImage;
  String? largeImage;

  AnimePictures({
    required this.image,
    required this.smallImage,
    required this.largeImage,
  });

  factory AnimePictures.fromJson(Map<String, dynamic> json) {
    return AnimePictures(
      image: json['jpg']["image_url"],
      smallImage: json['jpg']["small_image_url"],
      largeImage: json['jpg']["large_image_url"],
    );
  }
}
