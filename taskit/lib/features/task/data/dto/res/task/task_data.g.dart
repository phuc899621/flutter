// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskData _$TaskDataFromJson(Map<String, dynamic> json) => _TaskData(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      priority: json['priority'] as String,
      userId: UserData.fromJson(json['userId'] as Map<String, dynamic>),
      status: json['status'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => SubtaskData.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TaskDataToJson(_TaskData instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'priority': instance.priority,
      'userId': instance.userId,
      'status': instance.status,
      'dueDate': instance.dueDate.toIso8601String(),
      'subtasks': instance.subtasks,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_SubtaskData _$SubtaskDataFromJson(Map<String, dynamic> json) => _SubtaskData(
      id: json['_id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$SubtaskDataToJson(_SubtaskData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'taskId': instance.taskId,
    };
