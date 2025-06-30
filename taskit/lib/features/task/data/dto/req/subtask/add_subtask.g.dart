// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddSubtask _$AddSubtaskFromJson(Map<String, dynamic> json) => _AddSubtask(
      title: json['title'] as String,
      localId: (json['localId'] as num).toInt(),
    );

Map<String, dynamic> _$AddSubtaskToJson(_AddSubtask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'localId': instance.localId,
    };
