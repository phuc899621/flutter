// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskRes _$UpdateTaskResFromJson(Map<String, dynamic> json) =>
    _UpdateTaskRes(
      localId: (json['localId'] as num).toInt(),
      id: json['id'] as String,
      userId: json['userId'] as String,
      categoryId: json['categoryId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: json['priority'] as String,
      deleted: json['deleted'] as bool,
      status: json['status'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      hasTime: json['hasTime'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UpdateTaskResToJson(_UpdateTaskRes instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'title': instance.title,
      'description': instance.description,
      'priority': instance.priority,
      'deleted': instance.deleted,
      'status': instance.status,
      'dueDate': instance.dueDate?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'hasTime': instance.hasTime,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
