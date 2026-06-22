// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_sync_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksSyncRes _$TasksSyncResFromJson(Map<String, dynamic> json) =>
    _TasksSyncRes(
      accept: (json['accept'] as List<dynamic>)
          .map((e) => AcceptTaskSyncRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      reject: (json['reject'] as List<dynamic>)
          .map((e) => RejectTaskSyncRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TasksSyncResToJson(_TasksSyncRes instance) =>
    <String, dynamic>{'accept': instance.accept, 'reject': instance.reject};

_AcceptTaskSyncRes _$AcceptTaskSyncResFromJson(Map<String, dynamic> json) =>
    _AcceptTaskSyncRes(
      id: json['id'] as String,
      localId: (json['localId'] as num).toInt(),
    );

Map<String, dynamic> _$AcceptTaskSyncResToJson(_AcceptTaskSyncRes instance) =>
    <String, dynamic>{'id': instance.id, 'localId': instance.localId};

_RejectTaskSyncRes _$RejectTaskSyncResFromJson(Map<String, dynamic> json) =>
    _RejectTaskSyncRes(
      id: json['id'] as String?,
      localId: (json['localId'] as num).toInt(),
      serverData: json['serverData'] == null
          ? null
          : TaskServerRes.fromJson(json['serverData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RejectTaskSyncResToJson(_RejectTaskSyncRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'serverData': instance.serverData,
    };

_TaskServerRes _$TaskServerResFromJson(Map<String, dynamic> json) =>
    _TaskServerRes(
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
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TaskServerResToJson(_TaskServerRes instance) =>
    <String, dynamic>{
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
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
