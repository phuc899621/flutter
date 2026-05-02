import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_sync_data.freezed.dart';
part 'categories_sync_data.g.dart';

@freezed
abstract class CategoriesSyncData with _$CategoriesSyncData {
  const factory CategoriesSyncData({
    required List<AcceptCategoriesSyncData> accept,
  }) = _CategoriesSyncData;

  factory CategoriesSyncData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesSyncDataFromJson(json);
}

@freezed
abstract class AcceptCategoriesSyncData with _$AcceptCategoriesSyncData {
  const factory AcceptCategoriesSyncData({
    required String id,
    required int localId,
  }) = _AcceptCategoriesSyncData;

  factory AcceptCategoriesSyncData.fromJson(Map<String, dynamic> json) =>
      _$AcceptCategoriesSyncDataFromJson(json);
}

@freezed
abstract class RejectCategoriesSyncData with _$RejectCategoriesSyncData {
  const factory RejectCategoriesSyncData({
    String? id,
    required int localId,
    CategoryServerData? serverData,
  }) = _RejectCategoriesSyncData;

  factory RejectCategoriesSyncData.fromJson(Map<String, dynamic> json) =>
      _$RejectCategoriesSyncDataFromJson(json);
}

@freezed
abstract class CategoryServerData with _$CategoryServerData {
  const factory CategoryServerData({
    required String name,
    required DateTime updatedAt,
  }) = _CategoryServerData;

  factory CategoryServerData.fromJson(Map<String, dynamic> json) =>
      _$CategoryServerDataFromJson(json);
}
