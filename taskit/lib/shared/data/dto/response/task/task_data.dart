import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_data.g.dart';
part 'task_data.freezed.dart';

@freezed
abstract class TaskData with _$TaskData{
  const factory TaskData({
    @JsonKey(name: '_id') required String id,
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

  })=_TaskData;
  factory TaskData.fromJson(Map<String, dynamic> json) => _$TaskDataFromJson(json);

}

@freezed
abstract class TaskUserData with _$TaskUserData {
  const factory TaskUserData({
    @JsonKey(name: '_id') required String id,
    required String email,
    required String name,
  })=_TaskUserData;
  factory TaskUserData.fromJson(Map<String, dynamic> json) => _$TaskUserDataFromJson(json);
}

@freezed
abstract class SubtaskData with _$SubtaskData {
  const factory SubtaskData({
    @JsonKey(name: '_id') required String id,
    required String title,
    required bool isCompleted,
  })=_SubtaskData;

  factory SubtaskData.fromJson(Map<String, dynamic> json) =>
      _$SubtaskDataFromJson(json);
}

@freezed
abstract class TaskDataLst with _$TaskDataLst {
  const factory TaskDataLst({
    required List<TaskData> tasks,
  })=_TaskDataLst;
  factory TaskDataLst.fromJson(Map<String, dynamic> json) =>
      _$TaskDataLstFromJson(json);


}
