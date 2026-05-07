// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryRes _$CategoryResFromJson(Map<String, dynamic> json) => _CategoryRes(
  id: json['id'] as String,
  name: json['name'] as String,
  isDefault: json['default'] as bool,
  deleted: json['deleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  userId: json['userId'] as String,
);

Map<String, dynamic> _$CategoryResToJson(_CategoryRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'default': instance.isDefault,
      'deleted': instance.deleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'userId': instance.userId,
    };
