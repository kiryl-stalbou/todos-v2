part of domain_di;

final Provider<ChangeTodoStatusUseCase> changeTodoStatusUseCase = Provider<ChangeTodoStatusUseCase>(
  (ProviderRef<ChangeTodoStatusUseCase> ref) => ChangeTodoStatusUseCase(
    todoRepository: ref.read(todoRepository),
  ),
);

final Provider<CreateTodoUseCase> createTodoUseCase = Provider<CreateTodoUseCase>(
  (ProviderRef<CreateTodoUseCase> ref) => CreateTodoUseCase(
    todoRepository: ref.read(todoRepository),
  ),
);

final Provider<DeleteTodoUseCase> deleteTodoUseCase = Provider<DeleteTodoUseCase>(
  (ProviderRef<DeleteTodoUseCase> ref) => DeleteTodoUseCase(
    todoRepository: ref.read(todoRepository),
  ),
);

final Provider<GetTodoListUseCase> getTodoListUseCase = Provider<GetTodoListUseCase>(
  (ProviderRef<GetTodoListUseCase> ref) => GetTodoListUseCase(
    todoRepository: ref.read(todoRepository),
  ),
);
