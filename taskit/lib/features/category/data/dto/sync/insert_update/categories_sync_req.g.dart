// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_sync_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesSyncReq _$CategoriesSyncReqFromJson(Map<String, dynamic> json) =>
    _CategoriesSyncReq(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategorySyncReqEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesSyncReqToJson(_CategoriesSyncReq instance) =>
    <String, dynamic>{'categories': instance.categories};

_CategorySyncReqEntry _$CategorySyncReqEntryFromJson(
  Map<String, dynamic> json,
) => _CategorySyncReqEntry(
  id: json['id'] as String?,
  localId: (json['localId'] as num).toInt(),
  name: json['name'] as String,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CategorySyncReqEntryToJson(
  _CategorySyncReqEntry instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'name': instance.name,
  'updatedAt': instance.updatedAt.toIso8601String(),
};
