import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/task/domain/entities/task_status_enum.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required int localId,
    required String title,
    required String description,
    required CategoryEntity category,
    required TaskPriority priority,
    required int userLocalId,
    DateTime? completedAt,
    required TaskStatus status,
    DateTime? dueDate,
    required bool hasTime,
    required List<SubtaskEntity> subtasks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskEntity;
}
