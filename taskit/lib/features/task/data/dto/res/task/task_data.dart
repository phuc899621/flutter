import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/data/dto/res/user/user_data.dart';

part 'task_data.freezed.dart';
part 'task_data.g.dart';

@freezed
abstract class TaskData with _$TaskData {
  const factory TaskData({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String description,
    required String category,
    required String priority,
    required UserData userId,
    required String status,
    required DateTime dueDate,
    required List<SubtaskData> subtasks,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskData;
  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);
}

@freezed
abstract class SubtaskData with _$SubtaskData {
  const factory SubtaskData(
      {@JsonKey(name: '_id') required String id,
      required String title,
      required bool isCompleted,
      required String taskId}) = _SubtaskData;

  factory SubtaskData.fromJson(Map<String, dynamic> json) =>
      _$SubtaskDataFromJson(json);
}
