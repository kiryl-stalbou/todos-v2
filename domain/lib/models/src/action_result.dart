import 'package:core/core.dart';

class ActionResult extends Equatable {
  final bool success;
  final String message;
  final String? id;

  const ActionResult({
    required this.success,
    required this.message,
    required this.id,
  });

  @override
  List<Object?> get props => <Object?>[
        success,
        message,
        id,
      ];
}
