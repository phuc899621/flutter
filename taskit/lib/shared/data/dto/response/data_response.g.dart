// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataResponse<T> _$DataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _DataResponse<T>(
  message: json['message'] as String,
  data: fromJsonT(json['data']),
);

Map<String, dynamic> _$DataResponseToJson<T>(
  _DataResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'message': instance.message,
  'data': toJsonT(instance.data),
};
