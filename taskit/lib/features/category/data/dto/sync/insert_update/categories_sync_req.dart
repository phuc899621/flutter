import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_sync_req.freezed.dart';
part 'categories_sync_req.g.dart';

@freezed
sealed class CategoriesSyncReq with _$CategoriesSyncReq {
  const factory CategoriesSyncReq({
    required List<CategorySyncReqEntry> categories,
  }) = _CategoriesSyncReq;

  factory CategoriesSyncReq.fromJson(Map<String, dynamic> json) =>
      _$CategoriesSyncReqFromJson(json);
}

@freezed
sealed class CategorySyncReqEntry with _$CategorySyncReqEntry {
  const factory CategorySyncReqEntry({
    String? id,
    required int localId,
    required String name,
    required DateTime updatedAt,
  }) = _CategorySyncReqEntry;

  factory CategorySyncReqEntry.fromJson(Map<String, dynamic> json) =>
      _$CategorySyncReqEntryFromJson(json);
}
