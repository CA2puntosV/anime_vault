import 'package:anime_vault/src/providers/global_provider.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GlobalProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          body,
          Positioned(
            child: Selector<GlobalProvider, String>(
              selector: (_, provider) => provider.selected,
              builder: (_, selected, __) => BottomNavBar(
                selected: selected,
                onSelectedChanged: (value) {
                  provider.setSelected(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
