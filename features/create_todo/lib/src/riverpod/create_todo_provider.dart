import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'create_todo_notifier.dart';
import 'create_todo_state.dart';

final StateNotifierProvider<CreateTodoNotifier, CreateTodoState> createTodoProvider =
    StateNotifierProvider<CreateTodoNotifier, CreateTodoState>(
  (StateNotifierProviderRef<CreateTodoNotifier, CreateTodoState> ref) => CreateTodoNotifier(
    createTodoUseCase: ref.read(createTodoUseCase),
  ),
);
