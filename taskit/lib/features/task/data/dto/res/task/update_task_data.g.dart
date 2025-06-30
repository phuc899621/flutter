// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskData _$UpdateTaskDataFromJson(Map<String, dynamic> json) =>
    _UpdateTaskData(
      localId: (json['localId'] as num).toInt(),
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UpdateTaskDataToJson(_UpdateTaskData instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'subtasks': instance.subtasks,
    };
