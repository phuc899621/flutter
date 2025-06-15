// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiCategoryReq _$AiCategoryReqFromJson(Map<String, dynamic> json) =>
    _AiCategoryReq(
      title: json['title'] as String,
      excludedCategories: (json['excludedCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AiCategoryReqToJson(_AiCategoryReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'excludedCategories': instance.excludedCategories,
    };
