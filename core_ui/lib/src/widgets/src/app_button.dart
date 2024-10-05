import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isLocked;
  final bool isExpanded;
  final double? borderRadius;

  const AppButton({
    required this.title,
    required this.onTap,
    this.isLocked = false,
    this.isExpanded = true,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Container(
      width: isExpanded ? double.infinity : null,
      decoration: BoxDecoration(
        color: colors.accent,
        borderRadius: BorderRadius.circular(AppDimens.appBorderRadius),
      ),
      child: InkWell(
        onTap: isLocked ? null : onTap,
        borderRadius: BorderRadius.circular(AppDimens.appBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.contentPadding),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.raleway18Regular.copyWith(color: colors.buttonContent),
          ),
        ),
      ),
    );
  }
}
