import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';

import 'todo_tile.dart';

class TodoContent extends StatelessWidget {
  final List<Todo> completedTodos;
  final List<Todo> uncompletedTodos;
  final Function(String id) onDismissed;
  final Function({
    required String id,
    required bool status,
  }) onTap;

  const TodoContent({
    required this.completedTodos,
    required this.uncompletedTodos,
    required this.onDismissed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (uncompletedTodos.isNotEmpty) ...<Widget>{
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.appBigPagesPadding),
              itemCount: uncompletedTodos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoTile(
                  todo: uncompletedTodos[index],
                  onDismissed: onDismissed,
                  onTap: onTap,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: AppDimens.defaultSpacer),
            ),
          ),
        },
        if (completedTodos.isNotEmpty) ...<Widget>{
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.appBigPagesPadding,
              vertical: AppDimens.contentPadding,
            ),
            child: Text(LocaleKeys.todo_completedList.tr(), style: AppFonts.raleway24SemiBold),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.appBigPagesPadding),
              itemCount: completedTodos.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == completedTodos.length - 1
                        ? AppDimens.floatingButtonAppPadding
                        : 0.0,
                  ),
                  child: TodoTile(
                    todo: completedTodos[index],
                    onDismissed: onDismissed,
                    onTap: onTap,
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: AppDimens.defaultSpacer),
            ),
          ),
        },
      ],
    );
  }
}
