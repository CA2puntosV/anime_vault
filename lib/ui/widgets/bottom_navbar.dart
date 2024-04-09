import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

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
            icon: AppIcons.homeFill,
            func: () {},
          ),
          _Icon(
            icon: AppIcons.searhOutline,
            func: () {},
          ),
          _Icon(
            icon: AppIcons.bookmarkOutline,
            func: () {},
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
