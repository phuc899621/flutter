import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleted_categories_sync_data.freezed.dart';

part 'deleted_categories_sync_data.g.dart';

@freezed
abstract class DeletedCategoriesSyncData with _$DeletedCategoriesSyncData {
  const factory DeletedCategoriesSyncData({
    required int localId,
    required String id,
  }) = _DeletedCategoriesSyncData;

  factory DeletedCategoriesSyncData.fromJson(Map<String, dynamic> json) =>
      _$DeletedCategoriesSyncDataFromJson(json);
}
