import 'package:anime_vault/ui/widgets/screen_layout.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}
