import 'package:flutter/material.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';

class AppTextStyles {
  static const String font = 'Poppins';

  static const TextStyle title = TextStyle(
    fontFamily: font,
    fontSize: 30,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: font,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle textFieldTitle = TextStyle(
    fontFamily: font,
    fontSize: 20,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle description = TextStyle(
    fontFamily: font,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.grey,
  );

  static const TextStyle dot = TextStyle(
    fontFamily: font,
    fontSize: 30,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle primaryTextButton = TextStyle(
    fontFamily: font,
    fontSize: 16,
    color: AppColors.primary,
  );

  static const TextStyle smallbold = TextStyle(
    fontFamily: font,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle synopsis = TextStyle(
    fontFamily: font,
    fontSize: 13,
    color: AppColors.grey,
  );
}
