import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask.dart';

part 'update_task_req.freezed.dart';
part 'update_task_req.g.dart';

@freezed
sealed class UpdateTaskReq with _$UpdateTaskReq {
  const factory UpdateTaskReq.full(
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? hasTime,
      String? priority,
      String? status,
      required int localId,
      List<UpdateSubtaskReq>? subtasks,
      String? categoryId}) = _UpdateTaskFullReq;

  const factory UpdateTaskReq.titleOnly({
    required int localId,
    required String title,
  }) = _UpdateTaskTitleOnlyReq;

  const factory UpdateTaskReq.statusOnly({
    required int localId,
    required String status,
  }) = _UpdateTaskStatusOnlyReq;

  const factory UpdateTaskReq.priorityOnly({
    required int localId,
    required String priority,
  }) = _UpdateTaskPriorityOnlyReq;

  const factory UpdateTaskReq.dueDateOnly({
    required int localId,
    DateTime? dueDate,
  }) = _UpdateTaskDueDateOnlyReq;

  const factory UpdateTaskReq.hasTimeOnly({
    required int localId,
    required bool hasTime,
  }) = _UpdateTaskHasTimeOnlyReq;

  const factory UpdateTaskReq.descriptionOnly({
    required int localId,
    required String description,
  }) = _UpdateTaskDescriptionOnlyReq;

  const factory UpdateTaskReq.categoryIdOnly({
    required int localId,
    required String categoryId,
  }) = _UpdateTaskCategoryIdOnlyReq;

  factory UpdateTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskReqFromJson(json);
}
