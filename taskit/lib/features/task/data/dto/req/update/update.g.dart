// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateReqImpl<T> _$$UpdateReqImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$UpdateReqImpl<T>(
      updateData: fromJsonT(json['updateData']),
    );

Map<String, dynamic> _$$UpdateReqImplToJson<T>(
  _$UpdateReqImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'updateData': toJsonT(instance.updateData),
    };
