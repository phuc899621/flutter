import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_sync_req.freezed.dart';
part 'categories_sync_req.g.dart';

@freezed
abstract class CategoriesSyncReq with _$CategoriesSyncReq {
  const factory CategoriesSyncReq({
    required List<CategoriesSyncReqData> categories,
  }) = _CategoriesSyncReq;

  factory CategoriesSyncReq.fromJson(Map<String, dynamic> json) =>
      _$CategoriesSyncReqFromJson(json);
}

@freezed
abstract class CategoriesSyncReqData with _$CategoriesSyncReqData {
  const factory CategoriesSyncReqData({
    String? id,
    required int localId,
    required String name,
  }) = _CategoriesSyncReqData;

  factory CategoriesSyncReqData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesSyncReqDataFromJson(json);
}
