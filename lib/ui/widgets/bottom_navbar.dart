import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:anime_vault/ui/shared/nav_bar_options.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selected,
    required this.onSelectedChanged,
  });

  final String selected;
  final Function(String) onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.empty.withOpacity(0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Icon(
            icon: selected == NavBarOptions.home['name']
                ? AppIcons.homeFill
                : AppIcons.homeOutline,
            func: () {
              onSelectedChanged(
                NavBarOptions.home['name']!,
              );

              Navigator.pushReplacementNamed(
                context,
                NavBarOptions.home['path']!,
              );
            },
          ),
          _Icon(
            icon: selected == NavBarOptions.search['name']
                ? AppIcons.searchFill
                : AppIcons.searhOutline,
            func: () {
              onSelectedChanged(
                NavBarOptions.search['name']!,
              );

              Navigator.pushReplacementNamed(
                context,
                NavBarOptions.search['path']!,
              );
            },
          ),
          _Icon(
            icon: selected == NavBarOptions.bookmarks['name']
                ? AppIcons.bookmarkFill
                : AppIcons.bookmarkOutline,
            func: () {
              onSelectedChanged(
                NavBarOptions.bookmarks['name']!,
              );

              Navigator.pushReplacementNamed(
                context,
                NavBarOptions.bookmarks['path']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.icon,
    required this.func,
  });

  final String icon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      child: GestureDetector(
        onTap: func,
        child: Image.asset(
          icon,
        ),
      ),
    );
  }
}
