import 'dart:async';

import 'package:taskit/features/auth/domain/entities/forgot_pass/forgot_pass_entity.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

abstract interface class ForgotPasswordRepo {
  Future<MessageResult> forgotPassword(ForgotPasswordEntity data);

  Future<DataResult<ForgotPasswordVerifyResultEntity>> forgotPasswordVerify(
    ForgotPasswordVerifyEntity data,
  );

  Future<MessageResult> forgotPasswordResend(ForgotPasswordResendEntity data);

  Future<MessageResult> forgotPasswordReset(ForgotPasswordResetEntity data);
}
