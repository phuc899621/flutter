// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddTaskData _$AddTaskDataFromJson(Map<String, dynamic> json) => _AddTaskData(
      id: json['_id'] as String,
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      categoryId: json['categoryId'] as String,
      priority: json['priority'] as String,
      userId: json['userId'] as String,
      status: json['status'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      hasTime: json['hasTime'] as bool,
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => AddSubtaskData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddTaskDataToJson(_AddTaskData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'localId': instance.localId,
      'title': instance.title,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'priority': instance.priority,
      'userId': instance.userId,
      'status': instance.status,
      'dueDate': instance.dueDate?.toIso8601String(),
      'hasTime': instance.hasTime,
      'subtasks': instance.subtasks,
    };
