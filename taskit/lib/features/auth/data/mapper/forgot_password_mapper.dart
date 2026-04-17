import 'package:taskit/features/auth/data/dto/req/forgot_pass/forgot_password_request.dart';
import 'package:taskit/features/auth/domain/entities/forgot_pass/forgot_pass_entity.dart';

import '../dto/res/forgot_pass/verify.dart';

extension ForgotPasswordEntityMapper on ForgotPassEntity {
  ForgotPassRequest toDto() => map(
    forgot: (entity) => ForgotPasswordRequest(email: entity.email),
    verify: (entity) =>
        ForgotPasswordVerifyRequest(email: entity.email, otp: entity.otp),
    resend: (entity) => ForgotPasswordResendRequest(email: entity.email),
    reset: (entity) => ForgotPasswordResetRequest(
      resetToken: entity.resetToken,
      password: entity.password,
    ),
    verifyResult: (_) =>
        throw UnsupportedError("VerifyResult cannot mapped to DTO"),
  );
}

extension ForgotPasswordResultMapper on ForgotPassData {
  ForgotPasswordVerifyResultEntity toEntity() =>
      ForgotPasswordVerifyResultEntity(resetToken: resetToken);
}
