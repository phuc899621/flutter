import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/shared/data/dto/request/subtask.dart';

import '../response/task/task_data.dart';

part 'create_task.g.dart';
part 'create_task.freezed.dart';

@freezed
abstract class CreateTaskReq with _$CreateTaskReq{
  const factory CreateTaskReq({
    required String title,
    required String description,
    required String category,
    required String priority,
    required DateTime dueDate,
    required List<SubtaskReq> subtasks,
  })=_CreateTaskReq;
  factory CreateTaskReq.fromJson(Map<String, dynamic> json) => _$CreateTaskReqFromJson(json);

}