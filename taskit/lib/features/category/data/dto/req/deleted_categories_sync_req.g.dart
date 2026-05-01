// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_categories_sync_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeletedCategoriesSyncReqData _$DeletedCategoriesSyncReqDataFromJson(
  Map<String, dynamic> json,
) => _DeletedCategoriesSyncReqData(
  id: json['id'] as String?,
  localId: (json['localId'] as num).toInt(),
);

Map<String, dynamic> _$DeletedCategoriesSyncReqDataToJson(
  _DeletedCategoriesSyncReqData instance,
) => <String, dynamic>{'id': instance.id, 'localId': instance.localId};

_DeletedCategoriesSyncReq _$DeletedCategoriesSyncReqFromJson(
  Map<String, dynamic> json,
) => _DeletedCategoriesSyncReq(
  categories: (json['categories'] as List<dynamic>)
      .map(
        (e) => DeletedCategoriesSyncReqData.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$DeletedCategoriesSyncReqToJson(
  _DeletedCategoriesSyncReq instance,
) => <String, dynamic>{'categories': instance.categories};
