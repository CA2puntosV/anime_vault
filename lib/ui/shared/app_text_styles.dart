import 'package:flutter/material.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';

class AppTextStyles {
  static const String font = 'Poppins';

  static const TextStyle title = TextStyle(
    color: AppColors.white,
    fontFamily: font,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle dot = TextStyle(
    color: AppColors.mainColor,
    fontFamily: font,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}
