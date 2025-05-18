// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_pass_verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForgotPassVerifyRequest _$ForgotPassVerifyRequestFromJson(
        Map<String, dynamic> json) =>
    _ForgotPassVerifyRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$ForgotPassVerifyRequestToJson(
        _ForgotPassVerifyRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
