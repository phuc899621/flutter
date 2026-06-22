import 'package:freezed_annotation/freezed_annotation.dart';

import '../../subtask/response/subtask_res.dart';

part 'task_res.freezed.dart';
part 'task_res.g.dart';

@freezed
abstract class TaskRes with _$TaskRes {
  const factory TaskRes({
    int? localId,
    required String id,
    required String title,
    required String description,
    required String categoryId,
    required String priority,
    required String userId,
    required bool deleted,
    required String status,
    DateTime? dueDate,
    required bool hasTime,
    DateTime? completedAt,
    @Default([]) List<SubtaskRes> subtasks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskRes;

  factory TaskRes.fromJson(Map<String, dynamic> json) =>
      _$TaskResFromJson(json);
}
