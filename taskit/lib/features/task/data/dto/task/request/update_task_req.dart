import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_req.freezed.dart';
part 'update_task_req.g.dart';

@freezed
sealed class UpdateTaskReq with _$UpdateTaskReq {
  const factory UpdateTaskReq.title({
    required int localId,
    required String title,
  }) = _UpdateTaskTitleReq;

  const factory UpdateTaskReq.status({
    required int localId,
    required String status,
    DateTime? completedAt,
  }) = _UpdateTaskStatusReq;

  const factory UpdateTaskReq.priority({
    required int localId,
    required String priority,
  }) = _UpdateTaskPriorityReq;

  const factory UpdateTaskReq.dueDate({
    required int localId,
    DateTime? dueDate,
    required String status,
    required bool hasTime,
    DateTime? completedAt,
  }) = _UpdateTaskDueDateReq;

  const factory UpdateTaskReq.reminder({
    required int localId,
    DateTime? reminderAt,
    int? reminderOffset,
    required String reminderType,
    required String repeatType,
  }) = _UpdateTaskReminderReq;

  const factory UpdateTaskReq.description({
    required int localId,
    required String description,
  }) = _UpdateTaskDescriptionReq;

  const factory UpdateTaskReq.categoryId({
    required int localId,
    required String categoryId,
  }) = _UpdateTaskCategoryIdReq;

  factory UpdateTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskReqFromJson(json);
}
