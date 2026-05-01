// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_sync_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesSyncData _$CategoriesSyncDataFromJson(Map<String, dynamic> json) =>
    _CategoriesSyncData(
      id: json['id'] as String,
      localId: (json['localId'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoriesSyncDataToJson(_CategoriesSyncData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'name': instance.name,
    };
