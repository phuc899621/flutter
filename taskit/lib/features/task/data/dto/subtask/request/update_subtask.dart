import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_subtask.freezed.dart';
part 'update_subtask.g.dart';

@freezed
sealed class UpdateSubtaskReq with _$UpdateSubtaskReq {
  const factory UpdateSubtaskReq.all({
    required bool isCompleted,
    DateTime? completedAt,
    required int localId,
    required String title,
  }) = _UpdateSubtaskAllReq;

  const factory UpdateSubtaskReq.status({
    required bool isCompleted,
    DateTime? completedAt,
    required int localId,
  }) = _UpdateSubtaskStatusReq;

  const factory UpdateSubtaskReq.title({
    required int localId,
    required String title,
  }) = _UpdateSubtaskTitleReq;

  factory UpdateSubtaskReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskReqFromJson(json);
}
