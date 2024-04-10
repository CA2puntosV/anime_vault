import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    this.size,
  });

  final double rating;
  final double? size;

  @override
  Widget build(BuildContext context) {
    int filledStars = (rating / 2).round();
    int halfStars = ((rating / 2) - filledStars).round();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          if (index < filledStars) {
            // Estrella llena
            return Icon(
              Icons.star,
              size: size,
              color: Colors.yellow,
            );
          } else if (index == filledStars && halfStars == 1) {
            // Media estrella
            return Icon(
              Icons.star_half,
              size: size,
              color: Colors.yellow,
            );
          } else {
            // Estrella vacía
            return Icon(
              Icons.star_border,
              size: size,
              color: Colors.yellow,
            );
          }
        },
      ),
    );
  }
}
