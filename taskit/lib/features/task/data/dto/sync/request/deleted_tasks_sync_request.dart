import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleted_tasks_sync_request.freezed.dart';
part 'deleted_tasks_sync_request.g.dart';

@freezed
sealed class DeletedTasksSyncReqData with _$DeletedTasksSyncReqData {
  const factory DeletedTasksSyncReqData({String? id, required int localId}) =
      _DeletedTasksSyncReqData;

  factory DeletedTasksSyncReqData.fromJson(Map<String, dynamic> json) =>
      _$DeletedTasksSyncReqDataFromJson(json);
}

@freezed
sealed class DeletedTasksSyncReq with _$DeletedTasksSyncReq {
  const factory DeletedTasksSyncReq({
    required List<DeletedTasksSyncReqData> tasks,
  }) = _DeletedTasksSyncReq;

  factory DeletedTasksSyncReq.fromJson(Map<String, dynamic> json) =>
      _$DeletedTasksSyncReqFromJson(json);
}
