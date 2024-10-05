part of data_di;

final Provider<TodoProvider> todoProvider = Provider<TodoProvider>(
  (ProviderRef<TodoProvider> ref) => TodoProvider(
    apiProvider: ref.read(apiProvider),
  ),
);

final Provider<TodoRepository> todoRepository = Provider<TodoRepository>(
  (ProviderRef<TodoRepository> ref) => TodoRepositoryImpl(
    todoProvider: ref.read(todoProvider),
  ),
);
