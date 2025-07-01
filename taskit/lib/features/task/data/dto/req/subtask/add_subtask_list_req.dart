import 'package:freezed_annotation/freezed_annotation.dart';

import 'add_subtask.dart';

part 'add_subtask_list_req.g.dart';

part 'add_subtask_list_req.freezed.dart';

@freezed
sealed class AddSubtaskListReq with _$AddSubtaskListReq {
  const factory AddSubtaskListReq({
    required List<AddSubtaskReq> subtasks,
  }) = _AddSubtaskListReq;

  factory AddSubtaskListReq.fromJson(Map<String, dynamic> json) =>
      _$AddSubtaskListReqFromJson(json);
}
