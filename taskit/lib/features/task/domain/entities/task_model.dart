import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/dto/res/task/task_data.dart';

part 'task_model.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required String title,
    required String description,
    required String category,
    required String priority,
    required TaskUserData userId,
    required String status,
    required DateTime dueDate,
    required List<SubtaskData> subtasks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskEntity;
}

@freezed
abstract class LstTaskEntity with _$LstTaskEntity {
  const factory LstTaskEntity({
    required List<TaskEntity> tasks,
  }) = _LstTaskEntity;
}
