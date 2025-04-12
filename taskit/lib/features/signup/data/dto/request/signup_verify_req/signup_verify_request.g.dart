// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupVerifyRequest _$SignupVerifyRequestFromJson(Map<String, dynamic> json) =>
    _SignupVerifyRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$SignupVerifyRequestToJson(
        _SignupVerifyRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
