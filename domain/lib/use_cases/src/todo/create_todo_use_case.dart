part of use_case;

class CreateTodoUseCase extends FutureUseCase<String, ActionResult> {
  final TodoRepository _todoRepository;

  CreateTodoUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<ActionResult> execute(String input) async {
    return _todoRepository.createTodo(text: input);
  }
}
