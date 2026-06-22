// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_tasks_sync_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeletedTasksSyncReqData _$DeletedTasksSyncReqDataFromJson(
  Map<String, dynamic> json,
) => _DeletedTasksSyncReqData(
  id: json['id'] as String?,
  localId: (json['localId'] as num).toInt(),
);

Map<String, dynamic> _$DeletedTasksSyncReqDataToJson(
  _DeletedTasksSyncReqData instance,
) => <String, dynamic>{'id': instance.id, 'localId': instance.localId};

_DeletedTasksSyncReq _$DeletedTasksSyncReqFromJson(Map<String, dynamic> json) =>
    _DeletedTasksSyncReq(
      tasks: (json['tasks'] as List<dynamic>)
          .map(
            (e) => DeletedTasksSyncReqData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$DeletedTasksSyncReqToJson(
  _DeletedTasksSyncReq instance,
) => <String, dynamic>{'tasks': instance.tasks};
