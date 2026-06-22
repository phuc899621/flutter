import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/subtask/request/add_subtask_req.dart';

part 'add_task_req.freezed.dart';
part 'add_task_req.g.dart';

@freezed
abstract class AddTaskReq with _$AddTaskReq {
  const factory AddTaskReq({
    required String title,
    required int localId,
    required String description,
    String? categoryId,
    DateTime? reminderAt,
    required String priority,
    DateTime? dueDate,
    required bool hasTime,
    required String status,
    required List<AddSubtaskReq> subtasks,
  }) = _AddTaskReq;

  factory AddTaskReq.fromJson(Map<String, dynamic> json) =>
      _$AddTaskReqFromJson(json);
}
