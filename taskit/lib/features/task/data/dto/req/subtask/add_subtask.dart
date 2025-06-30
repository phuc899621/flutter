import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_subtask.freezed.dart';
part 'add_subtask.g.dart';

@freezed
sealed class AddSubtaskReq with _$AddSubtaskReq {
  const factory AddSubtaskReq({
    required String title,
    required int localId,
  }) = _AddSubtask;

  factory AddSubtaskReq.fromJson(Map<String, dynamic> json) =>
      _$AddSubtaskReqFromJson(json);
}
