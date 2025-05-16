import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/create_task/data/dto/request/create_task/subtask.dart';


part 'create_task.freezed.dart';
part 'create_task.g.dart';

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