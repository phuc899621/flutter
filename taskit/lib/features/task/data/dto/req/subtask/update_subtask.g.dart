// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateSubtaskAllReq _$UpdateSubtaskAllReqFromJson(Map<String, dynamic> json) =>
    _UpdateSubtaskAllReq(
      id: json['id'] as String,
      isCompleted: json['isCompleted'] as bool,
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateSubtaskAllReqToJson(
        _UpdateSubtaskAllReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isCompleted': instance.isCompleted,
      'localId': instance.localId,
      'title': instance.title,
      'runtimeType': instance.$type,
    };

_UpdateSubtaskStatusReq _$UpdateSubtaskStatusReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateSubtaskStatusReq(
      id: json['id'] as String,
      isCompleted: json['isCompleted'] as bool,
      localId: (json['localId'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateSubtaskStatusReqToJson(
        _UpdateSubtaskStatusReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isCompleted': instance.isCompleted,
      'localId': instance.localId,
      'runtimeType': instance.$type,
    };

_UpdateSubtaskTitleReq _$UpdateSubtaskTitleReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateSubtaskTitleReq(
      id: json['id'] as String,
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateSubtaskTitleReqToJson(
        _UpdateSubtaskTitleReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localId': instance.localId,
      'title': instance.title,
      'runtimeType': instance.$type,
    };
