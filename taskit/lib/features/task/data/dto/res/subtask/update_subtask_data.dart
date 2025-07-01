import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_subtask_data.freezed.dart';
part 'update_subtask_data.g.dart';

@freezed
sealed class UpdateSubtaskData with _$UpdateSubtaskData {
  const factory UpdateSubtaskData({required List<int> subtasks}) =
      _UpdateSubtaskData;

  factory UpdateSubtaskData.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskDataFromJson(json);
}
