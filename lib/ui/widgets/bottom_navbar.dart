import 'package:flutter/material.dart';

import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/router/router_path.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selected,
  });

  final String selected;

  @override
  Widget build(BuildContext context) {
    void nav(String path) {
      if (path != selected) {
        Navigator.pushNamed(context, path);
      }
    }

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
            icon: selected == RouterPath.home
                ? AppIcons.homeFill
                : AppIcons.homeOutline,
            func: () => nav(RouterPath.home),
          ),
          _Icon(
            icon: selected == RouterPath.search
                ? AppIcons.searchFill
                : AppIcons.searhOutline,
            func: () => nav(RouterPath.search),
          ),
          // _Icon(
          //   icon: selected == RouterPath.bookmarks
          //       ? AppIcons.bookmarkFill
          //       : AppIcons.bookmarkOutline,
          //   func: () => Navigator.pushNamed(
          //     context,
          //     RouterPath.home,
          //   ),
          // ),
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
