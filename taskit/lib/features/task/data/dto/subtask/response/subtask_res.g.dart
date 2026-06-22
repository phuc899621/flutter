// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubtaskRes _$SubtaskResFromJson(Map<String, dynamic> json) => _SubtaskRes(
  localId: (json['localId'] as num?)?.toInt(),
  id: json['id'] as String,
  title: json['title'] as String,
  completed: json['completed'] as bool,
  deleted: json['deleted'] as bool,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  taskId: json['taskId'] as String,
);

Map<String, dynamic> _$SubtaskResToJson(_SubtaskRes instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
      'deleted': instance.deleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'taskId': instance.taskId,
    };
