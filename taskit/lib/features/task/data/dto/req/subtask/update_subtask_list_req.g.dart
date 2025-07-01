// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subtask_list_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateSubtaskListReq _$UpdateSubtaskListReqFromJson(
        Map<String, dynamic> json) =>
    _UpdateSubtaskListReq(
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => UpdateSubtaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateSubtaskListReqToJson(
        _UpdateSubtaskListReq instance) =>
    <String, dynamic>{
      'subtasks': instance.subtasks,
    };
