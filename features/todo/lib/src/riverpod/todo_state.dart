import 'package:core/core.dart';
import 'package:domain/domain.dart';

class TodoState extends Equatable {
  final List<Todo> uncompletedTodos;
  final List<Todo> completedTodos;
  final String? errorMessage;
  final String? successMessage;
  final bool isLoading;

  const TodoState({
    this.uncompletedTodos = const <Todo>[],
    this.completedTodos = const <Todo>[],
    this.errorMessage,
    this.successMessage,
    this.isLoading = false,
  });

  TodoState copyWith({
    List<Todo>? uncompletedTodos,
    List<Todo>? completedTodos,
    String? errorMessage,
    String? successMessage,
    bool? isLoading,
  }) {
    return TodoState(
      uncompletedTodos: uncompletedTodos ?? this.uncompletedTodos,
      completedTodos: completedTodos ?? this.completedTodos,
      errorMessage: errorMessage,
      successMessage: successMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        uncompletedTodos,
        completedTodos,
        errorMessage,
        successMessage,
      ];
}
