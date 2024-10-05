import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core_ui.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField({
    this.controller,
    this.hintText,
    this.inputFormatters,
    this.maxLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return TextFormField(
      maxLines: obscureText ? 1 : maxLines,
      minLines: 1,
      cursorColor: colors.primaryText,
      style: AppFonts.raleway16Regular.copyWith(color: colors.primaryText),
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.textInputContentPaddingHorizontal,
          vertical: AppDimens.textInputContentPaddingVertical,
        ),
        hintText: hintText,
      ),
    );
  }
}
