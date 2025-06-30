import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_subtask.freezed.dart';
part 'update_subtask.g.dart';

@freezed
sealed class UpdateSubtaskWithTaskReq with _$UpdateSubtaskWithTaskReq {
  const factory UpdateSubtaskWithTaskReq(
      {required String id,
      bool? isCompleted,
      required int localId,
      String? title}) = _UpdateSubtaskWithTaskReq;

  factory UpdateSubtaskWithTaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskWithTaskReqFromJson(json);
}
