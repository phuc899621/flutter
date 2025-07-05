// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPassRequest _$ResetPassRequestFromJson(Map<String, dynamic> json) =>
    _ResetPassRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
    );

Map<String, dynamic> _$ResetPassRequestToJson(_ResetPassRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
    };
