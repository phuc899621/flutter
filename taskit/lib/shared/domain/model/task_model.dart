
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/dto/response/task/task_data.dart';

part 'task_model.freezed.dart';

@freezed
abstract class TaskModel with _$TaskModel{
  const factory TaskModel({
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
  })=_TaskModel;
}

@freezed
abstract class TaskModelLst with _$TaskModelLst{
  const factory TaskModelLst({
    required List<TaskModel> tasks,
  })=_TaskModelLst;
}
