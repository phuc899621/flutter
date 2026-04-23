// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsLoginRequest _$CredentialsLoginRequestFromJson(
  Map<String, dynamic> json,
) => CredentialsLoginRequest(
  email: json['email'] as String,
  password: json['password'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CredentialsLoginRequestToJson(
  CredentialsLoginRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'runtimeType': instance.$type,
};

GoogleLoginRequest _$GoogleLoginRequestFromJson(Map<String, dynamic> json) =>
    GoogleLoginRequest(
      token: json['token'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GoogleLoginRequestToJson(GoogleLoginRequest instance) =>
    <String, dynamic>{'token': instance.token, 'runtimeType': instance.$type};
