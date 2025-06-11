import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required int localId,
    required String title,
    required String description,
    required String category,
    required String priority,
    required int userLocalId,
    required String type,
    required String status,
    DateTime? scheduledDate,
    required bool hasScheduledTime,
    DateTime? deadlineDate,
    required List<SubtaskEntity> subtasks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskEntity;
}
