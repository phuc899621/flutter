import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_sync_request.freezed.dart';
part 'tasks_sync_request.g.dart';

@freezed
sealed class TasksSyncReq with _$TasksSyncReq {
  const factory TasksSyncReq({required List<TasksSyncReqEntry> tasks}) =
      _TasksSyncReq;

  factory TasksSyncReq.fromJson(Map<String, dynamic> json) =>
      _$TasksSyncReqFromJson(json);
}

@freezed
sealed class TasksSyncReqEntry with _$TasksSyncReqEntry {
  const factory TasksSyncReqEntry({
    String? id,
    required int localId,
    required String title,
    required String description,
    required String categoryId,
    required String priority,
    required bool deleted,
    required String status,
    DateTime? reminderAt,
    DateTime? dueDate,
    required bool hasTime,
    DateTime? completedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TasksSyncReqEntry;

  factory TasksSyncReqEntry.fromJson(Map<String, dynamic> json) =>
      _$TasksSyncReqEntryFromJson(json);
}
