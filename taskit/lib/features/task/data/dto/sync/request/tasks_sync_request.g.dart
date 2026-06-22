// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_sync_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksSyncReq _$TasksSyncReqFromJson(Map<String, dynamic> json) =>
    _TasksSyncReq(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TasksSyncReqEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TasksSyncReqToJson(_TasksSyncReq instance) =>
    <String, dynamic>{'tasks': instance.tasks};

_TasksSyncReqEntry _$TasksSyncReqEntryFromJson(Map<String, dynamic> json) =>
    _TasksSyncReqEntry(
      id: json['id'] as String?,
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      categoryId: json['categoryId'] as String,
      priority: json['priority'] as String,
      deleted: json['deleted'] as bool,
      status: json['status'] as String,
      reminderAt: json['reminderAt'] == null
          ? null
          : DateTime.parse(json['reminderAt'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      hasTime: json['hasTime'] as bool,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TasksSyncReqEntryToJson(_TasksSyncReqEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'title': instance.title,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'priority': instance.priority,
      'deleted': instance.deleted,
      'status': instance.status,
      'reminderAt': instance.reminderAt?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'hasTime': instance.hasTime,
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
