import 'package:domain/domain.dart';

import '../entities/request_result/request_result_entity.dart';
import '../entities/todo/todo_entity.dart';
import '../mappers/action_result_mapper.dart';
import '../mappers/todo_mapper.dart';
import '../providers/todo_provider.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoProvider _todoProvider;

  TodoRepositoryImpl({
    required TodoProvider todoProvider,
  }) : _todoProvider = todoProvider;

  @override
  Future<List<Todo>> getTodoList() async {
    final List<TodoEntity> list = await _todoProvider.getList();

    return list.map(TodoMapper.fromEntity).toList();
  }

  @override
  Future<ActionResult> createTodo({required String text}) async {
    final RequestResultEntity result = await _todoProvider.create(text: text);

    return ActionResultMapper.fromEntity(result);
  }

  @override
  Future<ActionResult> changeTodoStatus({
    required String todoId,
    required bool status,
  }) async {
    final RequestResultEntity result = await _todoProvider.changeStatus(
      status: status,
      todoId: todoId,
    );

    return ActionResultMapper.fromEntity(result);
  }

  @override
  Future<ActionResult> deleteTodo({required String todoId}) async {
    final RequestResultEntity result = await _todoProvider.delete(
      todoId: todoId,
    );

    return ActionResultMapper.fromEntity(result);
  }
}
