// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_sync_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesSyncRes _$CategoriesSyncResFromJson(Map<String, dynamic> json) =>
    _CategoriesSyncRes(
      accept: (json['accept'] as List<dynamic>)
          .map((e) => AcceptCategorySyncRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      reject: (json['reject'] as List<dynamic>)
          .map((e) => RejectCategorySyncRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesSyncResToJson(_CategoriesSyncRes instance) =>
    <String, dynamic>{'accept': instance.accept, 'reject': instance.reject};

_AcceptCategorySyncRes _$AcceptCategorySyncResFromJson(
  Map<String, dynamic> json,
) => _AcceptCategorySyncRes(
  id: json['id'] as String,
  localId: (json['localId'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$AcceptCategorySyncResToJson(
  _AcceptCategorySyncRes instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'name': instance.name,
};

_RejectCategorySyncRes _$RejectCategorySyncResFromJson(
  Map<String, dynamic> json,
) => _RejectCategorySyncRes(
  id: json['id'] as String?,
  localId: (json['localId'] as num).toInt(),
  serverData: json['serverData'] == null
      ? null
      : CategoryServerRes.fromJson(json['serverData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RejectCategorySyncResToJson(
  _RejectCategorySyncRes instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'serverData': instance.serverData,
};

_CategoryServerRes _$CategoryServerResFromJson(Map<String, dynamic> json) =>
    _CategoryServerRes(
      name: json['name'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CategoryServerResToJson(_CategoryServerRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
