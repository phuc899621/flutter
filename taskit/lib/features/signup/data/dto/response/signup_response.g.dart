// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    _SignupResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(_SignupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      email: json['email'] as String,
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'email': instance.email,
    };
