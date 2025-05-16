// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingDataImpl _$$SettingDataImplFromJson(Map<String, dynamic> json) =>
    _$SettingDataImpl(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      isNotificationEnabled: json['isNotificationEnabled'] as bool,
      language: json['language'] as String,
      theme: json['theme'] as String,
      remindBefore: (json['remindBefore'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SettingDataImplToJson(_$SettingDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'isNotificationEnabled': instance.isNotificationEnabled,
      'language': instance.language,
      'theme': instance.theme,
      'remindBefore': instance.remindBefore,
      'categories': instance.categories,
    };
