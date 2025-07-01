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
          ?.map((e) => UpdateSubtaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryId: json['categoryId'] as String?,
      $type: json['runtimeType'] as String?,
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
      'runtimeType': instance.$type,
    };

_UpdateTaskTitleOnlyReq _$UpdateTaskTitleOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskTitleOnlyReq(
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskTitleOnlyReqToJson(
        _UpdateTaskTitleOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'title': instance.title,
      'runtimeType': instance.$type,
    };

_UpdateTaskStatusOnlyReq _$UpdateTaskStatusOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskStatusOnlyReq(
      localId: (json['localId'] as num).toInt(),
      status: json['status'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskStatusOnlyReqToJson(
        _UpdateTaskStatusOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'status': instance.status,
      'runtimeType': instance.$type,
    };

_UpdateTaskPriorityOnlyReq _$UpdateTaskPriorityOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskPriorityOnlyReq(
      localId: (json['localId'] as num).toInt(),
      priority: json['priority'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskPriorityOnlyReqToJson(
        _UpdateTaskPriorityOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'priority': instance.priority,
      'runtimeType': instance.$type,
    };

_UpdateTaskDueDateOnlyReq _$UpdateTaskDueDateOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskDueDateOnlyReq(
      localId: (json['localId'] as num).toInt(),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskDueDateOnlyReqToJson(
        _UpdateTaskDueDateOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'dueDate': instance.dueDate?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_UpdateTaskHasTimeOnlyReq _$UpdateTaskHasTimeOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskHasTimeOnlyReq(
      localId: (json['localId'] as num).toInt(),
      hasTime: json['hasTime'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskHasTimeOnlyReqToJson(
        _UpdateTaskHasTimeOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'hasTime': instance.hasTime,
      'runtimeType': instance.$type,
    };

_UpdateTaskDescriptionOnlyReq _$UpdateTaskDescriptionOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskDescriptionOnlyReq(
      localId: (json['localId'] as num).toInt(),
      description: json['description'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskDescriptionOnlyReqToJson(
        _UpdateTaskDescriptionOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'description': instance.description,
      'runtimeType': instance.$type,
    };

_UpdateTaskCategoryIdOnlyReq _$UpdateTaskCategoryIdOnlyReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateTaskCategoryIdOnlyReq(
      localId: (json['localId'] as num).toInt(),
      categoryId: json['categoryId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskCategoryIdOnlyReqToJson(
        _UpdateTaskCategoryIdOnlyReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'categoryId': instance.categoryId,
      'runtimeType': instance.$type,
    };
