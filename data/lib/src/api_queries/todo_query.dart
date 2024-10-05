import '../api/helpers/api_query.dart';

class TodoQuery extends ApiQuery {
  static const String _userIdParam = 'user_id';
  static const String _todoIdParam = 'id';
  static const String _textBody = 'text';
  static const String _statusBody = 'completed';

  TodoQuery.getList({
    required String userId,
  }) : super(
          params: <String, String>{_userIdParam: userId},
        );

  TodoQuery.createTodo({
    required String userId,
    required String text,
  }) : super(
          params: <String, String>{_userIdParam: userId},
          body: <String, String>{
            _textBody: text,
          },
        );

  TodoQuery.changeStatus({
    required String userId,
    required String todoId,
    required bool status,
  }) : super(
          params: <String, String>{
            _userIdParam: userId,
            _todoIdParam: todoId,
          },
          body: <String, dynamic>{
            _statusBody: status,
          },
        );

  TodoQuery.delete({
    required String userId,
    required String todoId,
  }) : super(
          params: <String, String>{
            _userIdParam: userId,
            _todoIdParam: todoId,
          },
        );
}
