// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_generate_task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiGenerateTaskData _$AiGenerateTaskDataFromJson(Map<String, dynamic> json) =>
    _AiGenerateTaskData(
      title: json['title'] as String,
      description: json['description'] as String,
      userUtcDueDate: json['userUtcDueDate'] == null
          ? null
          : DateTime.parse(json['userUtcDueDate'] as String),
      hasTime: json['hasTime'] as bool,
      reminderAt: json['reminderAt'] == null
          ? null
          : DateTime.parse(json['reminderAt'] as String),
      categoryId: json['categoryId'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AiGenerateTaskDataToJson(_AiGenerateTaskData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'userUtcDueDate': instance.userUtcDueDate?.toIso8601String(),
      'hasTime': instance.hasTime,
      'reminderAt': instance.reminderAt?.toIso8601String(),
      'categoryId': instance.categoryId,
      'priority': instance.priority,
      'status': instance.status,
    };
