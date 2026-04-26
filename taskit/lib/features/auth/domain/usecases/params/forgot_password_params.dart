import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/forgot_pass/forgot_pass_entity.dart';

part 'forgot_password_params.freezed.dart';

@freezed
abstract class ForgotPassParams with _$ForgotPassParams {
  const factory ForgotPassParams.forgot({required String email}) =
      ForgotPasswordParams;

  const factory ForgotPassParams.verify({
    required String email,
    required String otp,
  }) = ForgotPasswordVerifyParams;

  const factory ForgotPassParams.reset({
    required String resetToken,
    required String password,
  }) = ForgotPasswordResetParams;

  const factory ForgotPassParams.resend({required String email}) =
      ForgotPasswordResendParams;

  const factory ForgotPassParams.verifyResult({required String resetToken}) =
      ForgotPasswordVerifyResultParams;
}

extension ForgotPasswordParamsX on ForgotPasswordParams {
  ForgotPasswordEntity toEntity() => ForgotPasswordEntity(email: email);
}

extension ForgotPasswordVerifyParamsX on ForgotPasswordVerifyParams {
  ForgotPasswordVerifyEntity toEntity() =>
      ForgotPasswordVerifyEntity(email: email, otp: otp);
}

extension ForgotPasswordResetParamsX on ForgotPasswordResetParams {
  ForgotPasswordResetEntity toEntity() =>
      ForgotPasswordResetEntity(resetToken: resetToken, password: password);
}

extension ForgotPasswordResendParamsX on ForgotPasswordResendParams {
  ForgotPasswordResendEntity toEntity() =>
      ForgotPasswordResendEntity(email: email);
}

extension ForgotPasswordVerifyResultParamsX
    on ForgotPasswordVerifyResultParams {
  ForgotPasswordVerifyResultEntity toEntity() =>
      ForgotPasswordVerifyResultEntity(resetToken: resetToken);
}
