// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _BaseResponse<T>(
      message: json['message'] as String,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  _BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': toJsonT(instance.data),
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      email: json['email'] as String,
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'email': instance.email,
    };
