import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_entity.freezed.dart';

@freezed
abstract class ForgotPassEntity with _$ForgotPassEntity {
  const factory ForgotPassEntity.forgot({required String email}) =
      ForgotPasswordEntity;

  const factory ForgotPassEntity.verify({
    required String email,
    required String otp,
  }) = ForgotPasswordVerifyEntity;

  const factory ForgotPassEntity.reset({
    required String resetToken,
    required String password,
  }) = ForgotPasswordResetEntity;

  const factory ForgotPassEntity.resend({required String email}) =
      ForgotPasswordResendEntity;

  const factory ForgotPassEntity.verifyResult({required String resetToken}) =
      ForgotPasswordVerifyResultEntity;

  static const initialForgot = ForgotPasswordEntity(email: '');
  static const initialVerify = ForgotPasswordVerifyEntity(email: '', otp: '');
  static const initialReset = ForgotPasswordResetEntity(
    resetToken: '',
    password: '',
  );
  static const initialResend = ForgotPasswordResendEntity(email: '');
}
