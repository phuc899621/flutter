// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateSubtaskAllReq _$UpdateSubtaskAllReqFromJson(Map<String, dynamic> json) =>
    _UpdateSubtaskAllReq(
      isCompleted: json['isCompleted'] as bool,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateSubtaskAllReqToJson(
  _UpdateSubtaskAllReq instance,
) => <String, dynamic>{
  'isCompleted': instance.isCompleted,
  'completedAt': instance.completedAt?.toIso8601String(),
  'localId': instance.localId,
  'title': instance.title,
  'runtimeType': instance.$type,
};

_UpdateSubtaskStatusReq _$UpdateSubtaskStatusReqFromJson(
  Map<String, dynamic> json,
) => _UpdateSubtaskStatusReq(
  isCompleted: json['isCompleted'] as bool,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  localId: (json['localId'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateSubtaskStatusReqToJson(
  _UpdateSubtaskStatusReq instance,
) => <String, dynamic>{
  'isCompleted': instance.isCompleted,
  'completedAt': instance.completedAt?.toIso8601String(),
  'localId': instance.localId,
  'runtimeType': instance.$type,
};

_UpdateSubtaskTitleReq _$UpdateSubtaskTitleReqFromJson(
  Map<String, dynamic> json,
) => _UpdateSubtaskTitleReq(
  localId: (json['localId'] as num).toInt(),
  title: json['title'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateSubtaskTitleReqToJson(
  _UpdateSubtaskTitleReq instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'title': instance.title,
  'runtimeType': instance.$type,
};
