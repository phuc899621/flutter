// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskFullReq _$UpdateTaskFullReqFromJson(Map<String, dynamic> json) =>
    _UpdateTaskFullReq(
      title: json['title'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      hasTime: json['hasTime'] as bool?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      localId: (json['localId'] as num).toInt(),
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((e) =>
              UpdateSubtaskWithTaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryId: json['categoryId'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$UpdateTaskFullReqToJson(_UpdateTaskFullReq instance) =>
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
      'type': instance.$type,
    };

_UpdateTaskTitleOnlyReq _$UpdateTaskTitleOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskTitleOnlyReq(
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$UpdateTaskTitleOnlyReqToJson(
        _UpdateTaskTitleOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'title': instance.title,
      'type': instance.$type,
    };

_UpdateTaskStatusOnlyReq _$UpdateTaskStatusOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskStatusOnlyReq(
      localId: (json['localId'] as num).toInt(),
      status: json['status'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$UpdateTaskStatusOnlyReqToJson(
        _UpdateTaskStatusOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'status': instance.status,
      'type': instance.$type,
    };
