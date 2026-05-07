import 'package:freezed_annotation/freezed_annotation.dart';

part 'deleted_categories_sync_res.freezed.dart';
part 'deleted_categories_sync_res.g.dart';

@freezed
sealed class DeletedCategoriesSyncRes with _$DeletedCategoriesSyncRes {
  const factory DeletedCategoriesSyncRes({
    required int localId,
    required String id,
  }) = _DeletedCategoriesSyncRes;

  factory DeletedCategoriesSyncRes.fromJson(Map<String, dynamic> json) =>
      _$DeletedCategoriesSyncResFromJson(json);
}
