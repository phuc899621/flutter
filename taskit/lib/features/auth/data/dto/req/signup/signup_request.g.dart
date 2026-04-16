// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRegisterRequest _$SignupRegisterRequestFromJson(
  Map<String, dynamic> json,
) => SignupRegisterRequest(
  email: json['email'] as String,
  password: json['password'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SignupRegisterRequestToJson(
  SignupRegisterRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'runtimeType': instance.$type,
};

SignupVerifyRequest _$SignupVerifyRequestFromJson(Map<String, dynamic> json) =>
    SignupVerifyRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SignupVerifyRequestToJson(
  SignupVerifyRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'otp': instance.otp,
  'runtimeType': instance.$type,
};

SignupResendRequest _$SignupResendRequestFromJson(Map<String, dynamic> json) =>
    SignupResendRequest(
      email: json['email'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SignupResendRequestToJson(
  SignupResendRequest instance,
) => <String, dynamic>{'email': instance.email, 'runtimeType': instance.$type};
