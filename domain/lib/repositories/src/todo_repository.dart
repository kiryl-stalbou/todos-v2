import '../../domain.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodoList();

  Future<ActionResult> createTodo({
    required String text,
  });

  Future<ActionResult> changeTodoStatus({
    required String todoId,
    required bool status,
  });

  Future<ActionResult> deleteTodo({
    required String todoId,
  });
}
