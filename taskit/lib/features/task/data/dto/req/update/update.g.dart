// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateReq<T> _$UpdateReqFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _UpdateReq<T>(
      updateData: fromJsonT(json['updateData']),
    );

Map<String, dynamic> _$UpdateReqToJson<T>(
  _UpdateReq<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'updateData': toJsonT(instance.updateData),
    };
