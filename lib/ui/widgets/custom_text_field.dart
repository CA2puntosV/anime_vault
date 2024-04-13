import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:anime_vault/ui/shared/decoration_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.onChanged,
    this.keyboardType,
    this.obscureText = false,
  });

  final String title;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: AppTextStyles.subtitle,
        textAlign: TextAlign.start,
        textCapitalization: TextCapitalization.sentences,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: DecorationStyles.fieldBorder,
          disabledBorder: DecorationStyles.fieldBorder,
          enabledBorder: DecorationStyles.fieldBorder,
          errorBorder: DecorationStyles.fieldBorder,
          focusedBorder: DecorationStyles.fieldBorder,
          focusedErrorBorder: DecorationStyles.fieldBorder,
          labelText: title,
          labelStyle: AppTextStyles.textFieldTitle,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
