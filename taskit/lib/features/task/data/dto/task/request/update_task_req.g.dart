// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskTitleReq _$UpdateTaskTitleReqFromJson(Map<String, dynamic> json) =>
    _UpdateTaskTitleReq(
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskTitleReqToJson(_UpdateTaskTitleReq instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'title': instance.title,
      'runtimeType': instance.$type,
    };

_UpdateTaskStatusReq _$UpdateTaskStatusReqFromJson(Map<String, dynamic> json) =>
    _UpdateTaskStatusReq(
      localId: (json['localId'] as num).toInt(),
      status: json['status'] as String,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateTaskStatusReqToJson(
  _UpdateTaskStatusReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'status': instance.status,
  'completedAt': instance.completedAt?.toIso8601String(),
  'runtimeType': instance.$type,
};

_UpdateTaskPriorityReq _$UpdateTaskPriorityReqFromJson(
  Map<String, dynamic> json,
) => _UpdateTaskPriorityReq(
  localId: (json['localId'] as num).toInt(),
  priority: json['priority'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateTaskPriorityReqToJson(
  _UpdateTaskPriorityReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'priority': instance.priority,
  'runtimeType': instance.$type,
};

_UpdateTaskDueDateReq _$UpdateTaskDueDateReqFromJson(
  Map<String, dynamic> json,
) => _UpdateTaskDueDateReq(
  localId: (json['localId'] as num).toInt(),
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  status: json['status'] as String,
  hasTime: json['hasTime'] as bool,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateTaskDueDateReqToJson(
  _UpdateTaskDueDateReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'dueDate': instance.dueDate?.toIso8601String(),
  'status': instance.status,
  'hasTime': instance.hasTime,
  'completedAt': instance.completedAt?.toIso8601String(),
  'runtimeType': instance.$type,
};

_UpdateTaskReminderReq _$UpdateTaskReminderReqFromJson(
  Map<String, dynamic> json,
) => _UpdateTaskReminderReq(
  localId: (json['localId'] as num).toInt(),
  reminderAt: json['reminderAt'] == null
      ? null
      : DateTime.parse(json['reminderAt'] as String),
  reminderOffset: (json['reminderOffset'] as num?)?.toInt(),
  reminderType: json['reminderType'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateTaskReminderReqToJson(
  _UpdateTaskReminderReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'reminderAt': instance.reminderAt?.toIso8601String(),
  'reminderOffset': instance.reminderOffset,
  'reminderType': instance.reminderType,
  'runtimeType': instance.$type,
};

_UpdateTaskDescriptionReq _$UpdateTaskDescriptionReqFromJson(
  Map<String, dynamic> json,
) => _UpdateTaskDescriptionReq(
  localId: (json['localId'] as num).toInt(),
  description: json['description'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateTaskDescriptionReqToJson(
  _UpdateTaskDescriptionReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'description': instance.description,
  'runtimeType': instance.$type,
};

_UpdateTaskCategoryIdReq _$UpdateTaskCategoryIdReqFromJson(
  Map<String, dynamic> json,
) => _UpdateTaskCategoryIdReq(
  localId: (json['localId'] as num).toInt(),
  categoryId: json['categoryId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateTaskCategoryIdReqToJson(
  _UpdateTaskCategoryIdReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'categoryId': instance.categoryId,
  'runtimeType': instance.$type,
};
