import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_request.freezed.dart';
part 'forgot_password_request.g.dart';

@freezed
abstract class ForgotPassRequest with _$ForgotPassRequest {
  const factory ForgotPassRequest.forgot({required String email}) =
      ForgotPasswordRequest;

  const factory ForgotPassRequest.verify({
    required String email,
    required String otp,
  }) = ForgotPasswordVerifyRequest;

  const factory ForgotPassRequest.resend({required String email}) =
      ForgotPasswordResendRequest;

  const factory ForgotPassRequest.reset({
    required String resetToken,
    required String password,
  }) = ForgotPasswordResetRequest;

  factory ForgotPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassRequestFromJson(json);
}
