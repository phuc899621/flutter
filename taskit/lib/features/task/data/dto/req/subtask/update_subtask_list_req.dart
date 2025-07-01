import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask.dart';

part 'update_subtask_list_req.freezed.dart';
part 'update_subtask_list_req.g.dart';

@freezed
sealed class UpdateSubtaskListReq with _$UpdateSubtaskListReq {
  const factory UpdateSubtaskListReq({
    required List<UpdateSubtaskReq> subtasks,
  }) = _UpdateSubtaskListReq;

  factory UpdateSubtaskListReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskListReqFromJson(json);
}
