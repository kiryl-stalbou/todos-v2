import 'package:core/core.dart';

class CreateTodoState extends Equatable {
  final String? errorMessage;
  final String? successMessage;

  const CreateTodoState({
    this.errorMessage,
    this.successMessage,
  });

  CreateTodoState copyWith({
    String? errorMessage,
    String? successMessage,
  }) {
    return CreateTodoState(
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        errorMessage,
        successMessage,
      ];
}
