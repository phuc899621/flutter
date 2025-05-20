// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingData _$SettingDataFromJson(Map<String, dynamic> json) => _SettingData(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      isNotificationEnabled: json['isNotificationEnabled'] as bool,
      language: json['language'] as String,
      theme: json['theme'] as String,
      remindBefore: (json['remindBefore'] as num).toInt(),
    );

Map<String, dynamic> _$SettingDataToJson(_SettingData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'isNotificationEnabled': instance.isNotificationEnabled,
      'language': instance.language,
      'theme': instance.theme,
      'remindBefore': instance.remindBefore,
    };
