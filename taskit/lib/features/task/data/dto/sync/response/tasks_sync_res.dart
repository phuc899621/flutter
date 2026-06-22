import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_sync_res.freezed.dart';
part 'tasks_sync_res.g.dart';

@freezed
sealed class TasksSyncRes with _$TasksSyncRes {
  const factory TasksSyncRes({
    required List<AcceptTaskSyncRes> accept,
    required List<RejectTaskSyncRes> reject,
  }) = _TasksSyncRes;

  factory TasksSyncRes.fromJson(Map<String, dynamic> json) =>
      _$TasksSyncResFromJson(json);
}

@freezed
sealed class AcceptTaskSyncRes with _$AcceptTaskSyncRes {
  const factory AcceptTaskSyncRes({required String id, required int localId}) =
      _AcceptTaskSyncRes;

  factory AcceptTaskSyncRes.fromJson(Map<String, dynamic> json) =>
      _$AcceptTaskSyncResFromJson(json);
}

@freezed
sealed class RejectTaskSyncRes with _$RejectTaskSyncRes {
  const factory RejectTaskSyncRes({
    String? id,
    required int localId,
    TaskServerRes? serverData,
  }) = _RejectTaskSyncRes;

  factory RejectTaskSyncRes.fromJson(Map<String, dynamic> json) =>
      _$RejectTaskSyncResFromJson(json);
}

@freezed
sealed class TaskServerRes with _$TaskServerRes {
  const factory TaskServerRes({
    required String title,
    required String description,
    required String categoryId,
    required String priority,
    required String userId,
    required bool deleted,
    required String status,
    DateTime? dueDate,
    required bool hasTime,
    DateTime? completedAt,
    required DateTime updatedAt,
  }) = _TaskServerRes;

  factory TaskServerRes.fromJson(Map<String, dynamic> json) =>
      _$TaskServerResFromJson(json);
}
