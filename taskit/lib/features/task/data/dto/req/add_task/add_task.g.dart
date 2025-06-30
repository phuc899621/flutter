// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddTaskReq _$AddTaskReqFromJson(Map<String, dynamic> json) => _AddTaskReq(
      title: json['title'] as String,
      localId: (json['localId'] as num).toInt(),
      description: json['description'] as String,
      categoryId: json['categoryId'] as String,
      priority: json['priority'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      hasTime: json['hasTime'] as bool,
      status: json['status'] as String,
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => AddSubtaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddTaskReqToJson(_AddTaskReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'localId': instance.localId,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'priority': instance.priority,
      'dueDate': instance.dueDate?.toIso8601String(),
      'hasTime': instance.hasTime,
      'status': instance.status,
      'subtasks': instance.subtasks,
    };
