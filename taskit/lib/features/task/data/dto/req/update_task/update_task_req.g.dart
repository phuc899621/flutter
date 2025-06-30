// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskReq _$UpdateTaskReqFromJson(Map<String, dynamic> json) =>
    _UpdateTaskReq(
      title: json['title'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      hasTime: json['hasTime'] as bool?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      localId: (json['localId'] as num?)?.toInt(),
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((e) =>
              UpdateSubtaskWithTaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$UpdateTaskReqToJson(_UpdateTaskReq instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate?.toIso8601String(),
      'hasTime': instance.hasTime,
      'priority': instance.priority,
      'status': instance.status,
      'localId': instance.localId,
      'subtasks': instance.subtasks,
      'categoryId': instance.categoryId,
    };
