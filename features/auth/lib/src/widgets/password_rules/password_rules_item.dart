import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordRulesItem extends StatelessWidget {
  final String rule;

  const PasswordRulesItem({
    required this.rule,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 16),
        AppIcons.dot(
          color: colors.hintText,
          size: AppDimens.iconSizeTiny,
        ),
        const SizedBox(width: 8),
        Text(
          rule,
          style: AppFonts.raleway14Regular.copyWith(
            color: colors.hintText,
          ),
        ),
      ],
    );
  }
}
