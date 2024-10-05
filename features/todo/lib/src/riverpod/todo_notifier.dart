import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'todo_state.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final GetTodoListUseCase _getTodoListUseCase;
  final ChangeTodoStatusUseCase _changeTodoStatusUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoNotifier({
    required GetTodoListUseCase getTodoListUseCase,
    required ChangeTodoStatusUseCase changeTodoStatusUseCase,
    required DeleteTodoUseCase deleteTodoUseCase,
  })  : _getTodoListUseCase = getTodoListUseCase,
        _changeTodoStatusUseCase = changeTodoStatusUseCase,
        _deleteTodoUseCase = deleteTodoUseCase,
        super(const TodoState()) {
    getTodoLists();
  }

  Future<void> getTodoLists() async {
    try {
      state = state.copyWith(isLoading: true);
      final List<Todo> commonList = await _getTodoListUseCase.execute();

      state = state.copyWith(
        isLoading: false,
        completedTodos: commonList.where((Todo item) => item.isCompleted).toList()..reversed,
        uncompletedTodos: commonList.where((Todo item) => !item.isCompleted).toList()..reversed,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> changeTodoStatus({
    required String id,
    required bool status,
  }) async {
    try {
      final ActionResult result = await _changeTodoStatusUseCase.execute(
        ChangeTodoStatusPayload(todoId: id, status: status),
      );

      if (result.success) {
        final List<Todo> newCompletedList;
        final List<Todo> newUncompletedList;
        if (status) {
          newCompletedList = <Todo>[...state.completedTodos];
          final Todo todo = state.uncompletedTodos.firstWhere((Todo item) => item.id == id);
          newCompletedList.insert(
            0,
            Todo(id: todo.id, text: todo.text, isCompleted: !todo.isCompleted),
          );

          newUncompletedList = <Todo>[...state.uncompletedTodos]
            ..removeWhere((Todo item) => item.id == id);
        } else {
          newCompletedList = <Todo>[...state.completedTodos]
            ..removeWhere((Todo item) => item.id == id);

          newUncompletedList = <Todo>[...state.uncompletedTodos];
          final Todo todo = state.completedTodos.firstWhere((Todo item) => item.id == id);
          newUncompletedList.insert(
            0,
            Todo(id: todo.id, text: todo.text, isCompleted: !todo.isCompleted),
          );
        }

        state = state.copyWith(
          completedTodos: newCompletedList,
          uncompletedTodos: newUncompletedList,
          successMessage: result.message,
        );
      } else {
        state = state.copyWith(
          errorMessage: result.message,
        );
      }
    } catch (error) {
      state = state.copyWith(
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      final ActionResult actionResult = await _deleteTodoUseCase.execute(id);

      if (actionResult.success) {
        final List<Todo> newCompletedList = <Todo>[...state.completedTodos]
          ..removeWhere((Todo item) => item.id == id);
        final List<Todo> newUncompletedList = <Todo>[...state.uncompletedTodos]
          ..removeWhere((Todo item) => item.id == id);

        state = state.copyWith(
          completedTodos: newCompletedList,
          uncompletedTodos: newUncompletedList,
          successMessage: actionResult.message,
        );
      } else {
        state = state.copyWith(
          errorMessage: actionResult.message,
        );
      }
    } catch (error) {
      state = state.copyWith(
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> openCreateTodoScreen() async {
    final Todo? newTodo = await AppNavigator.pushToCreateTodoScreen<Todo?>();

    if (newTodo != null) {
      final List<Todo> newList = <Todo>[newTodo, ...state.uncompletedTodos];

      state = state.copyWith(
        uncompletedTodos: newList,
      );
    }
  }
}
