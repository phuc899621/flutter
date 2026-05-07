import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleted_categories_sync_req.freezed.dart';
part 'deleted_categories_sync_req.g.dart';

@freezed
sealed class DeletedCategoriesSyncReqData with _$DeletedCategoriesSyncReqData {
  const factory DeletedCategoriesSyncReqData({
    String? id,
    required int localId,
  }) = _DeletedCategoriesSyncReqData;

  factory DeletedCategoriesSyncReqData.fromJson(Map<String, dynamic> json) =>
      _$DeletedCategoriesSyncReqDataFromJson(json);
}

@freezed
sealed class DeletedCategoriesSyncReq with _$DeletedCategoriesSyncReq {
  const factory DeletedCategoriesSyncReq({
    required List<DeletedCategoriesSyncReqData> categories,
  }) = _DeletedCategoriesSyncReq;

  factory DeletedCategoriesSyncReq.fromJson(Map<String, dynamic> json) =>
      _$DeletedCategoriesSyncReqFromJson(json);
}
