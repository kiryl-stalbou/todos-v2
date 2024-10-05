import 'package:domain/domain.dart';

import '../entities/request_result/request_result_entity.dart';

class ActionResultMapper {
  static ActionResult fromEntity(RequestResultEntity entity) {
    return ActionResult(
      success: entity.success,
      message: entity.message,
      id: entity.id,
    );
  }
}
