import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'riverpod/todo_provider.dart';
import 'widgets/empty_state.dart';
import 'widgets/todo_content.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return ProviderScope(
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.todo_pageName.tr(),
          isShowBackButton: false,
          actions: <Widget>[
            Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Container(
                decoration: BoxDecoration(
                  color: colors.accent,
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(right: AppDimens.appBigPagesPadding),
                padding: const EdgeInsets.all(AppDimens.iconExtraSmallPadding),
                child: AppIcons.reload(
                  color: colors.buttonContent,
                  onTap: () => ref.read(todoProvider.notifier).getTodoLists(),
                  size: AppDimens.iconSizeExtraSmall,
                ),
              );
            }),
          ],
        ),
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final List<Todo> completedTodos = ref.watch(todoProvider).completedTodos;
            final List<Todo> uncompletedTodos = ref.watch(todoProvider).uncompletedTodos;
            final String? successMessage = ref.watch(todoProvider).successMessage;
            final String? errorMessage = ref.watch(todoProvider).errorMessage;
            final bool isLoading = ref.watch(todoProvider).isLoading;

            if (successMessage != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      successMessage,
                      style: AppFonts.raleway16Regular.copyWith(
                        color: context.theme.colors.successContent,
                      ),
                    ),
                  ),
                );
              });
            }

            if (errorMessage != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      errorMessage,
                      style: AppFonts.raleway16Regular.copyWith(
                        color: context.theme.colors.successContent,
                      ),
                    ),
                  ),
                );
              });
            }

            if (isLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.floatingButtonAppPadding),
                child: CircularProgressIndicator(color: context.theme.colors.accent),
              ),
            );
            }

            if (completedTodos.isEmpty && uncompletedTodos.isEmpty) {
              return EmptyState();
            }

            return TodoContent(
              completedTodos: completedTodos,
              uncompletedTodos: uncompletedTodos,
              onDismissed: (String id) => ref.read(todoProvider.notifier).deleteTodo(id),
              onTap: ({
                required String id,
                required bool status,
              }) {
                ref.read(todoProvider.notifier).changeTodoStatus(id: id, status: status);
              },
            );
          },
        ),
        floatingActionButton: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return GestureDetector(
              onTap: () => ref.read(todoProvider.notifier).openCreateTodoScreen(),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.accent,
                  shape: BoxShape.circle,
                ),
                child: AppIcons.plus(
                  size: AppDimens.iconSizeMedium,
                  color: colors.buttonContent,
                  padding: const EdgeInsets.all(AppDimens.iconPadding),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
