// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPassRequestImpl _$$ResetPassRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPassRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$ResetPassRequestImplToJson(
        _$ResetPassRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
