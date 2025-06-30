// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateSubtaskWithTaskReq _$UpdateSubtaskWithTaskReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateSubtaskWithTaskReq(
      id: json['id'] as String,
      isCompleted: json['isCompleted'] as bool?,
      localId: (json['localId'] as num).toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$UpdateSubtaskWithTaskReqToJson(
        _UpdateSubtaskWithTaskReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isCompleted': instance.isCompleted,
      'localId': instance.localId,
      'title': instance.title,
    };
