import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_result_entity.freezed.dart';

part 'request_result_entity.g.dart';

@freezed
class RequestResultEntity with _$RequestResultEntity {
  const factory RequestResultEntity({
    required bool success,
    required String message,
    required String? id,
  }) = _RequestResultEntity;

  factory RequestResultEntity.fromJson(Map<String, Object?> json) =>
      _$RequestResultEntityFromJson(json);
}
