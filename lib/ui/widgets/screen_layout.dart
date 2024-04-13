import 'package:anime_vault/src/providers/global_provider.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({
    super.key,
    required this.body,
    required this.currentScreen,
  });

  final Widget body;
  final String currentScreen;

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
  void initState() {
    final provider = context.read<GlobalProvider>();

    provider.setSelected(widget.currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: CustomScrollView(
              physics: const ScrollPhysics(),
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(0.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        widget.body,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: BottomNavBar(
              selected: widget.currentScreen,
            ),
          ),
        ],
      ),
    );
  }
}
