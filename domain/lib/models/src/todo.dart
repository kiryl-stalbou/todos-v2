import 'package:core/core.dart';

class Todo extends Equatable {
  final String id;
  final String text;
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.text,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => <Object?>[
        id,
        text,
        isCompleted,
      ];
}
