import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: AppImages.emptyTodoList(width: AppDimens.imageSize),
        ),
        const SizedBox(height: AppDimens.mediumSpacer),
        Text(
          LocaleKeys.todo_noData.tr(),
          style: AppFonts.raleway24SemiBold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimens.floatingButtonAppPadding),
      ],
    );
  }
}
