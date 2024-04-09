import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.func,
  });

  final String label;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: func,
      child: Text(
        label,
        style: AppTextStyles.primaryTextButton,
      ),
    );
  }
}
