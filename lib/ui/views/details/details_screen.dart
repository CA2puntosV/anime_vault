import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/src/providers/details_provider.dart';
import 'package:anime_vault/ui/views/details/details_anime_info.dart';
import 'package:anime_vault/ui/views/details/details_background.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    get();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    super.initState();
  }

  void get() async {
    final provider = context.read<DetailsProvider>();
    provider.getAnimePictures(widget.anime.id);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //TODO if is readmore load screen without stack
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          DetailsBackground(
            anime: widget.anime,
          ),
          FadeTransition(
            opacity: _animation,
            child: DetailsAnimeInfo(
              anime: widget.anime,
            ),
          ),
        ],
      ),
    );
  }
}
