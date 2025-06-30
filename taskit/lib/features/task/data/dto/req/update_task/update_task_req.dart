import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask.dart';

part 'update_task_req.freezed.dart';
part 'update_task_req.g.dart';

@Freezed(unionKey: 'type')
sealed class UpdateTaskReq with _$UpdateTaskReq {
  const factory UpdateTaskReq.full(
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? hasTime,
      String? priority,
      String? status,
      required int localId,
      List<UpdateSubtaskWithTaskReq>? subtasks,
      String? categoryId}) = _UpdateTaskFullReq;

  const factory UpdateTaskReq.titleOnly({
    required int localId,
    required String title,
  }) = _UpdateTaskTitleOnlyReq;

  const factory UpdateTaskReq.statusOnly({
    required int localId,
    required String status,
  }) = _UpdateTaskStatusOnlyReq;

  factory UpdateTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskReqFromJson(json);
}
