import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_subtask_data.freezed.dart';
part 'add_subtask_data.g.dart';

@freezed
sealed class AddSubtaskData with _$AddSubtaskData {
  const factory AddSubtaskData({
    required int localId,
    @JsonKey(name: '_id') required String id,
  }) = _AddSubtaskData;

  factory AddSubtaskData.fromJson(Map<String, dynamic> json) =>
      _$AddSubtaskDataFromJson(json);
}
