import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtask_res.freezed.dart';
part 'subtask_res.g.dart';

@freezed
abstract class SubtaskRes with _$SubtaskRes {
  const factory SubtaskRes({
    int? localId,
    required String id,
    required String title,
    required bool completed,
    required bool deleted,
    DateTime? completedAt,
    required DateTime updatedAt,
    required DateTime createdAt,
    required String taskId,
  }) = _SubtaskRes;

  factory SubtaskRes.fromJson(Map<String, dynamic> json) =>
      _$SubtaskResFromJson(json);
}
