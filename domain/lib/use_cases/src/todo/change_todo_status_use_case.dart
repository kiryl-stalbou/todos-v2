part of use_case;

class ChangeTodoStatusUseCase extends FutureUseCase<ChangeTodoStatusPayload, ActionResult> {
  final TodoRepository _todoRepository;

  ChangeTodoStatusUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<ActionResult> execute(ChangeTodoStatusPayload input) async {
    return _todoRepository.changeTodoStatus(
      todoId: input.todoId,
      status: input.status,
    );
  }
}

class ChangeTodoStatusPayload {
  final String todoId;
  final bool status;

  ChangeTodoStatusPayload({
    required this.todoId,
    required this.status,
  });
}
