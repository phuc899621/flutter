import 'package:freezed_annotation/freezed_annotation.dart';

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
    required String userId,
    required String status,
    DateTime? scheduledDate,
    required bool hasScheduledTime,
    DateTime? deadlineDate,
    required String type,
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
      required DateTime updatedAt,
      required DateTime createdAt,
      required String taskId}) = _SubtaskData;

  factory SubtaskData.fromJson(Map<String, dynamic> json) =>
      _$SubtaskDataFromJson(json);
}
