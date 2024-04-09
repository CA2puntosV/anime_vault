import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class WideCard extends StatelessWidget {
  const WideCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size screen = MediaQuery.of(context).size;
    // final width = screen.width.round();
    // final height = screen.height.round();
    //width * 0.76,
    //height * 0.23

    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.empty,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('a'),
    );
  }
}
