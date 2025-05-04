// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) =>
    _CategoryData(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CategoryDataToJson(_CategoryData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
