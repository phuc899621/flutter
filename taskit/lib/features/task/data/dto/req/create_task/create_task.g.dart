// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTaskReqImpl _$$CreateTaskReqImplFromJson(Map<String, dynamic> json) =>
    _$CreateTaskReqImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      priority: json['priority'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => SubtaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateTaskReqImplToJson(_$CreateTaskReqImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'priority': instance.priority,
      'dueDate': instance.dueDate.toIso8601String(),
      'subtasks': instance.subtasks,
    };
