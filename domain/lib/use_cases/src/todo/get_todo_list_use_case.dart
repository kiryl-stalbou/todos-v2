part of use_case;

class GetTodoListUseCase extends FutureUseCase<NoParams, List<Todo>> {
  final TodoRepository _todoRepository;

  GetTodoListUseCase({
    required TodoRepository todoRepository,
  }) : _todoRepository = todoRepository;

  @override
  Future<List<Todo>> execute([NoParams? input]) async {
    return _todoRepository.getTodoList();
  }
}
