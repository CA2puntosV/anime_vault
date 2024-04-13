import 'package:anime_vault/ui/widgets/image_widget.dart';
import 'package:flutter/material.dart';

import 'package:anime_vault/src/models/anime_model.dart';

class DetailsBackground extends StatelessWidget {
  const DetailsBackground({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Hero(
      tag: '${anime.id}',
      child: Stack(
        children: [
          SizedBox(
            height: screen.height * 0.65,
            child: ImageWidget(
              imagePath: anime.largeImageUrl,
              width: screen.width,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0, 0.3, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(17, 17, 17, 0),
                    Color(0xff111111),
                    Color(0xff111111)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
