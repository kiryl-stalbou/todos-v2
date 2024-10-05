part of use_case;

class DeleteTodoUseCase extends FutureUseCase<String, ActionResult> {
  final TodoRepository _todoRepository;

  DeleteTodoUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<ActionResult> execute(String input) async {
    return _todoRepository.deleteTodo(todoId: input);
  }
}
