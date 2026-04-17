// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordRequest(
  email: json['email'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ForgotPasswordRequestToJson(
  ForgotPasswordRequest instance,
) => <String, dynamic>{'email': instance.email, 'runtimeType': instance.$type};

ForgotPasswordVerifyRequest _$ForgotPasswordVerifyRequestFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordVerifyRequest(
  email: json['email'] as String,
  otp: json['otp'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ForgotPasswordVerifyRequestToJson(
  ForgotPasswordVerifyRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'otp': instance.otp,
  'runtimeType': instance.$type,
};

ForgotPasswordResendRequest _$ForgotPasswordResendRequestFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordResendRequest(
  email: json['email'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ForgotPasswordResendRequestToJson(
  ForgotPasswordResendRequest instance,
) => <String, dynamic>{'email': instance.email, 'runtimeType': instance.$type};

ForgotPasswordResetRequest _$ForgotPasswordResetRequestFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordResetRequest(
  resetToken: json['resetToken'] as String,
  password: json['password'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ForgotPasswordResetRequestToJson(
  ForgotPasswordResetRequest instance,
) => <String, dynamic>{
  'resetToken': instance.resetToken,
  'password': instance.password,
  'runtimeType': instance.$type,
};
