// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskRes _$TaskResFromJson(Map<String, dynamic> json) => _TaskRes(
  localId: (json['localId'] as num?)?.toInt(),
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  categoryId: json['categoryId'] as String,
  priority: json['priority'] as String,
  userId: json['userId'] as String,
  deleted: json['deleted'] as bool,
  status: json['status'] as String,
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  hasTime: json['hasTime'] as bool,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  subtasks:
      (json['subtasks'] as List<dynamic>?)
          ?.map((e) => SubtaskRes.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TaskResToJson(_TaskRes instance) => <String, dynamic>{
  'localId': instance.localId,
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'categoryId': instance.categoryId,
  'priority': instance.priority,
  'userId': instance.userId,
  'deleted': instance.deleted,
  'status': instance.status,
  'dueDate': instance.dueDate?.toIso8601String(),
  'hasTime': instance.hasTime,
  'completedAt': instance.completedAt?.toIso8601String(),
  'subtasks': instance.subtasks,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
