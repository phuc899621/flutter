// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_subtask_list_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddSubtaskListReq _$AddSubtaskListReqFromJson(Map<String, dynamic> json) =>
    _AddSubtaskListReq(
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => AddSubtaskReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddSubtaskListReqToJson(_AddSubtaskListReq instance) =>
    <String, dynamic>{
      'subtasks': instance.subtasks,
    };
