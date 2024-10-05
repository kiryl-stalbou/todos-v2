import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'todo_notifier.dart';
import 'todo_state.dart';

final StateNotifierProvider<TodoNotifier, TodoState> todoProvider =
    StateNotifierProvider<TodoNotifier, TodoState>(
  (StateNotifierProviderRef<TodoNotifier, TodoState> ref) => TodoNotifier(
    getTodoListUseCase: ref.read(getTodoListUseCase),
    changeTodoStatusUseCase: ref.read(changeTodoStatusUseCase),
    deleteTodoUseCase: ref.read(deleteTodoUseCase),
  ),
);
