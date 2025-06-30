// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_subtask_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddSubtaskData _$AddSubtaskDataFromJson(Map<String, dynamic> json) =>
    _AddSubtaskData(
      localId: (json['localId'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$AddSubtaskDataToJson(_AddSubtaskData instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      '_id': instance.id,
    };
