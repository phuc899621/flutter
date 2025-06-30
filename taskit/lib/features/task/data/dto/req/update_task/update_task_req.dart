import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask.dart';

part 'update_task_req.freezed.dart';
part 'update_task_req.g.dart';

@freezed
sealed class UpdateTaskReq with _$UpdateTaskReq {
  const factory UpdateTaskReq(
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? hasTime,
      String? priority,
      String? status,
      int? localId,
      List<UpdateSubtaskWithTaskReq>? subtasks,
      String? categoryId}) = _UpdateTaskReq;

  factory UpdateTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskReqFromJson(json);
}
