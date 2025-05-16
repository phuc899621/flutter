// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupVerifyRequestImpl _$$SignupVerifyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupVerifyRequestImpl(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$SignupVerifyRequestImplToJson(
        _$SignupVerifyRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
