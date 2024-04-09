import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text,
              style: AppTextStyles.title,
            ),
            const TextSpan(text: '.', style: AppTextStyles.dot),
          ],
        ),
      ),
    );
  }
}
