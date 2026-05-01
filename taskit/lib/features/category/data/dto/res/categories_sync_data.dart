import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_sync_data.freezed.dart';
part 'categories_sync_data.g.dart';

@freezed
abstract class CategoriesSyncData with _$CategoriesSyncData {
  const factory CategoriesSyncData({
    required String id,
    required int localId,
    required String name,
  }) = _CategoriesSyncData;

  factory CategoriesSyncData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesSyncDataFromJson(json);
}
