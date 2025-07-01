// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddCategoryReq _$AddCategoryReqFromJson(Map<String, dynamic> json) =>
    _AddCategoryReq(
      name: json['name'] as String,
      localId: (json['localId'] as num).toInt(),
    );

Map<String, dynamic> _$AddCategoryReqToJson(_AddCategoryReq instance) =>
    <String, dynamic>{
      'name': instance.name,
      'localId': instance.localId,
    };
