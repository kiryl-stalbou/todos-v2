import 'package:core_ui/core_ui.dart';
import 'package:domain/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final Function(String id) onDismissed;
  final Function({
    required String id,
    required bool status,
  }) onTap;

  const TodoTile({
    required this.todo,
    required this.onDismissed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        onDismissed(todo.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.contentBigPadding,
          horizontal: AppDimens.contentBigPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.appBorderSmallRadius),
          color: todo.isCompleted ? colors.successBackground : colors.listTileBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppIcons.todoIcon(size: AppDimens.iconSizeMedium),
            const SizedBox(width: AppDimens.doubleDefaultSpacer),
            Expanded(
              child: Text(
                todo.text,
                style: AppFonts.raleway14Regular,
              ),
            ),
            const SizedBox(width: AppDimens.doubleDefaultSpacer),
            GestureDetector(
              onTap: () {
                onTap(id: todo.id, status: !todo.isCompleted);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: todo.isCompleted ? colors.successContent : colors.accent,
                ),
                padding: const EdgeInsets.all(AppDimens.iconExtraSmallPadding),
                child: todo.isCompleted
                    ? AppIcons.check(
                        size: AppDimens.iconSizeExtraSmall,
                        color: colors.buttonContent,
                      )
                    : const SizedBox(
                        width: AppDimens.iconSizeExtraSmall,
                        height: AppDimens.iconSizeExtraSmall,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
