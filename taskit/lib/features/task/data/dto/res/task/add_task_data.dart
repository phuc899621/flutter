import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/res/subtask/add_subtask_data.dart';
import 'package:taskit/features/task/data/dto/res/task/task_data.dart';

part 'add_task_data.freezed.dart';
part 'add_task_data.g.dart';

@freezed
sealed class AddTaskData with _$AddTaskData {
  const factory AddTaskData({
    @JsonKey(name: '_id') required String id,
    required int localId,
    required String title,
    required String description,
    required String categoryId,
    required String priority,
    required String userId,
    required String status,
    DateTime? dueDate,
    required bool hasTime,
    required List<AddSubtaskData> subtasks,
  }) = _AddTaskData;

  factory AddTaskData.fromJson(Map<String, dynamic> json) =>
      _$AddTaskDataFromJson(json);
}
