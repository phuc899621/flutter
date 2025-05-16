
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtask.g.dart';
part 'subtask.freezed.dart';

@freezed
abstract class SubtaskReq with _$SubtaskReq {
  const factory SubtaskReq({
    required String title,
  })=_SubtaskReq;
  factory SubtaskReq.fromJson(Map<String, dynamic> json) => _$SubtaskReqFromJson(json);
}