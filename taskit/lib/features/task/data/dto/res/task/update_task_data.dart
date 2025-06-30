import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_data.freezed.dart';
part 'update_task_data.g.dart';

@freezed
sealed class UpdateTaskData with _$UpdateTaskData {
  const factory UpdateTaskData({
    required int localId,
    required List<int> subtasks,
  }) = _UpdateTaskData;

  factory UpdateTaskData.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskDataFromJson(json);
}
