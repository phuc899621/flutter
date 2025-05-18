// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDataImpl _$$TaskDataImplFromJson(Map<String, dynamic> json) =>
    _$TaskDataImpl(
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

Map<String, dynamic> _$$TaskDataImplToJson(_$TaskDataImpl instance) =>
    <String, dynamic>{
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

_$SubtaskDataImpl _$$SubtaskDataImplFromJson(Map<String, dynamic> json) =>
    _$SubtaskDataImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$SubtaskDataImplToJson(_$SubtaskDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
    };

_$TaskDataLstImpl _$$TaskDataLstImplFromJson(Map<String, dynamic> json) =>
    _$TaskDataLstImpl(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskDataLstImplToJson(_$TaskDataLstImpl instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
