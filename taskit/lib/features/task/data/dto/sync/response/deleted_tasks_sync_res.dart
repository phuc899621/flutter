import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleted_tasks_sync_res.freezed.dart';
part 'deleted_tasks_sync_res.g.dart';

@freezed
sealed class DeletedTasksSyncRes with _$DeletedTasksSyncRes {
  const factory DeletedTasksSyncRes({
    required int localId,
    required String id,
  }) = _DeletedTasksSyncRes;

  factory DeletedTasksSyncRes.fromJson(Map<String, dynamic> json) =>
      _$DeletedTasksSyncResFromJson(json);
}
