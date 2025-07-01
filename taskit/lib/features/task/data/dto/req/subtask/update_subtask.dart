import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_subtask.freezed.dart';
part 'update_subtask.g.dart';

@freezed
sealed class UpdateSubtaskReq with _$UpdateSubtaskReq {
  const factory UpdateSubtaskReq.all(
      {required String id,
      required bool isCompleted,
      required int localId,
      required String title}) = _UpdateSubtaskAllReq;

  const factory UpdateSubtaskReq.statusOnly({
    required String id,
    required bool isCompleted,
    required int localId,
  }) = _UpdateSubtaskStatusReq;

  const factory UpdateSubtaskReq.titleOnly(
      {required String id,
      required int localId,
      required String title}) = _UpdateSubtaskTitleReq;

  factory UpdateSubtaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskReqFromJson(json);
}
