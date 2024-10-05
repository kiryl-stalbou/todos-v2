import 'package:domain/domain.dart';

import '../entities/todo/todo_entity.dart';

class TodoMapper {
  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      id: entity.id,
      text: entity.text,
      isCompleted: entity.completed,
    );
  }
}
