import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  final String message;

  const SuccessMessage({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.contentPadding),
      decoration: BoxDecoration(
        color: colors.successBackground,
        borderRadius: BorderRadius.circular(AppDimens.appBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppIcons.done(
            color: colors.successContent,
            size: AppDimens.iconSizeSmall,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: AppFonts.raleway16Regular.copyWith(
                color: colors.successContent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
