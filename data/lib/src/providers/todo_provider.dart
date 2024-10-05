import 'dart:async';

import '../api/api_constants.dart';
import '../api/api_privider.dart';
import '../api_queries/todo_query.dart';
import '../entities/request_result/request_result_entity.dart';
import '../entities/todo/todo_entity.dart';

class TodoProvider {
  final ApiProvider _apiProvider;

  const TodoProvider({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  Future<List<TodoEntity>> getList() {
    return _apiProvider.get(
      TodoQuery.getList(userId: ApiConstants.userId),
      parser: (Map<String, dynamic> json) {
        final List<dynamic> list = json[ApiConstants.responseList];

        return list
            .map(
              (dynamic entity) => TodoEntity.fromJson(entity as Map<String, dynamic>),
            )
            .cast<TodoEntity>()
            .toList();
      },
    );
  }

  Future<RequestResultEntity> create({
    required String text,
  }) {
    return _apiProvider.post(
      TodoQuery.createTodo(
        userId: ApiConstants.userId,
        text: text,
      ),
      parser: (Map<String, dynamic> json) {
        return RequestResultEntity.fromJson(json);
      },
    );
  }

  Future<RequestResultEntity> changeStatus({
    required bool status,
    required String todoId,
  }) {
    return _apiProvider.patch(
      TodoQuery.changeStatus(
        userId: ApiConstants.userId,
        status: status,
        todoId: todoId,
      ),
      parser: (Map<String, dynamic> json) {
        return RequestResultEntity.fromJson(json);
      },
    );
  }

  Future<RequestResultEntity> delete({
    required String todoId,
  }) {
    return _apiProvider.delete(
      TodoQuery.delete(
        userId: ApiConstants.userId,
        todoId: todoId,
      ),
      parser: (Map<String, dynamic> json) {
        return RequestResultEntity.fromJson(json);
      },
    );
  }
}
