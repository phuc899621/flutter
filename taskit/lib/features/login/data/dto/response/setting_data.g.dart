// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingData _$SettingDataFromJson(Map<String, dynamic> json) => _SettingData(
      isNotificationEnabled: json['isNotificationEnabled'] as bool,
      language: json['language'] as String,
      theme: json['theme'] as String,
      remindBefore: (json['remindBefore'] as num).toInt(),
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SettingDataToJson(_SettingData instance) =>
    <String, dynamic>{
      'isNotificationEnabled': instance.isNotificationEnabled,
      'language': instance.language,
      'theme': instance.theme,
      'remindBefore': instance.remindBefore,
      'category': instance.category,
    };
