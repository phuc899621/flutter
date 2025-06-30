import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask.dart';
import 'package:taskit/features/task/data/dto/req/subtask/subtask.dart';

part 'add_task.freezed.dart';
part 'add_task.g.dart';

@freezed
abstract class AddTaskReq with _$AddTaskReq {
  const factory AddTaskReq({
    required String title,
    required int localId,
    required String description,
    required String categoryId,
    required String priority,
    DateTime? dueDate,
    required bool hasTime,
    required String status,
    required List<AddSubtaskReq> subtasks,
  }) = _AddTaskReq;

  factory AddTaskReq.fromJson(Map<String, dynamic> json) =>
      _$AddTaskReqFromJson(json);
}
