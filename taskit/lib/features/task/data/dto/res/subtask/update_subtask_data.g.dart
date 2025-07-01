// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subtask_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateSubtaskData _$UpdateSubtaskDataFromJson(Map<String, dynamic> json) =>
    _UpdateSubtaskData(
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UpdateSubtaskDataToJson(_UpdateSubtaskData instance) =>
    <String, dynamic>{
      'subtasks': instance.subtasks,
    };
