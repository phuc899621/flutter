import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_sync_res.freezed.dart';
part 'categories_sync_res.g.dart';

@freezed
sealed class CategoriesSyncRes with _$CategoriesSyncRes {
  const factory CategoriesSyncRes({
    required List<AcceptCategorySyncRes> accept,
    required List<RejectCategorySyncRes> reject,
  }) = _CategoriesSyncRes;

  factory CategoriesSyncRes.fromJson(Map<String, dynamic> json) =>
      _$CategoriesSyncResFromJson(json);
}

@freezed
sealed class AcceptCategorySyncRes with _$AcceptCategorySyncRes {
  const factory AcceptCategorySyncRes({
    required String id,
    required int localId,
    required String name,
  }) = _AcceptCategorySyncRes;

  factory AcceptCategorySyncRes.fromJson(Map<String, dynamic> json) =>
      _$AcceptCategorySyncResFromJson(json);
}

@freezed
sealed class RejectCategorySyncRes with _$RejectCategorySyncRes {
  const factory RejectCategorySyncRes({
    String? id,
    required int localId,
    CategoryServerRes? serverData,
  }) = _RejectCategorySyncRes;

  factory RejectCategorySyncRes.fromJson(Map<String, dynamic> json) =>
      _$RejectCategorySyncResFromJson(json);
}

@freezed
sealed class CategoryServerRes with _$CategoryServerRes {
  const factory CategoryServerRes({
    required String name,
    required DateTime updatedAt,
  }) = _CategoryServerRes;

  factory CategoryServerRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryServerResFromJson(json);
}
