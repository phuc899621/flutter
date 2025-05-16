// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_pass_verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPassVerifyRequestImpl _$$ForgotPassVerifyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPassVerifyRequestImpl(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$ForgotPassVerifyRequestImplToJson(
        _$ForgotPassVerifyRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
