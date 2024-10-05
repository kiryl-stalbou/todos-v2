import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppRichText extends StatelessWidget {
  final String text;
  final String tapText;
  final VoidCallback onTap;
  final TextAlign textAlign;

  const AppRichText({
    required this.text,
    required this.tapText,
    required this.onTap,
    this.textAlign = TextAlign.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '$text ',
            style: AppFonts.raleway16Regular.copyWith(color: colors.primaryText),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: tapText,
            style: AppFonts.raleway16Regular.copyWith(
              color: colors.accent,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
