import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'create_todo_state.dart';

class CreateTodoNotifier extends StateNotifier<CreateTodoState> {
  final CreateTodoUseCase _createTodoUseCase;

  CreateTodoNotifier({
    required CreateTodoUseCase createTodoUseCase,
  })  : _createTodoUseCase = createTodoUseCase,
        super(const CreateTodoState());

  Future<void> createTodo(String text) async {
    if (text.isNotEmpty) {
      try {
        final ActionResult result = await _createTodoUseCase.execute(text);

        if (result.success && result.id != null) {
          state = state.copyWith(
            successMessage: result.message,
          );
          AppNavigator.pop(
            Todo(id: result.id!, text: text, isCompleted: false),
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
  }
}
