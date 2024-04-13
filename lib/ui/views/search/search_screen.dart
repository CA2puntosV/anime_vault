import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/shared/app_strings.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:anime_vault/ui/widgets/title_widget.dart';
import 'package:anime_vault/ui/widgets/screen_layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return ScreenLayout(
      currentScreen: 'search',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          33.0.spaceV,
          const _Header(),
          _SearchBar(screen: screen),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      height: 70,
      width: screen.width,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        children: [
          16.0.spaceH,
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(AppIcons.back),
          ),
          const TitleWidget(
            text: AppStrings.search,
          ),
        ],
      ),
    );
  }
}
