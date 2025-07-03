import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_task_entity.freezed.dart';

@freezed
sealed class AiTaskEntity with _$AiTaskEntity {
  const factory AiTaskEntity(
      {required String title,
      required String description,
      DateTime? userUtcDueDate,
      required bool hasTime,
      required String categoryId,
      required String priority,
      required String status}) = _AiTaskEntity;
}
