import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/mapper/forgot_password_mapper.dart';
import 'package:taskit/features/auth/data/repo/forgot_password_repo.dart';
import 'package:taskit/features/auth/data/source/remote/forgot_password_api.dart';
import 'package:taskit/shared/data/mapper/result_mapper.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/domain/entities/data_result.dart';
import '../../../../shared/domain/entities/message_result.dart';
import '../../../../shared/log/logger_provider.dart';
import '../../domain/entities/forgot_pass/forgot_pass_entity.dart';

final forgotPasswordRepoProvider = Provider<ForgotPasswordRepo>((ref) {
  final api = ref.watch(forgotPasswordApiProvider);
  return ForgotPasswordRepoImpl(api);
});

class ForgotPasswordRepoImpl
    with DioExceptionMapper
    implements ForgotPasswordRepo {
  final ForgotPasswordApi _api;

  ForgotPasswordRepoImpl(this._api);

  @override
  Future<MessageResult> forgotPassword(ForgotPasswordEntity data) async =>
      callSafe(() async {
        logger.i('[ForgotPasswordRepo] sending forgot password request');
        final result = await _api.forgotPassword(data.toDto());
        logger.d('[ForgotPasswordRepo] forgot password request sent');
        return result.toResult();
      }, errorMessage: "Forgot password failed");

  @override
  Future<MessageResult> forgotPasswordReset(
    ForgotPasswordResetEntity data,
  ) async => callSafe(() async {
    logger.i('[ForgotPasswordRepo] sending forgot password reset request');
    final result = await _api.forgotPasswordReset(data.toDto());
    logger.d('[ForgotPasswordRepo] forgot password reset request sent');
    return result.toResult();
  }, errorMessage: "Forgot password reset failed");

  @override
  Future<DataResult<ForgotPasswordVerifyResultEntity>> forgotPasswordVerify(
    ForgotPasswordVerifyEntity data,
  ) async => callSafe(() async {
    logger.i('[ForgotPasswordRepo] sending forgot password verify request');
    final result = await _api.forgotPasswordVerify(data.toDto());
    logger.d('[ForgotPasswordRepo] forgot password verify request sent');
    return result.toResult(result.data.toEntity());
  }, errorMessage: "Forgot password verify failed");

  @override
  Future<MessageResult> forgotPasswordResend(
    ForgotPasswordResendEntity data,
  ) async => callSafe(() async {
    logger.i('[ForgotPasswordRepo] sending forgot password resend request');
    final result = await _api.forgotPasswordResend(data.toDto());
    logger.d('[ForgotPasswordRepo] forgot password resend request sent');
    return result.toResult();
  }, errorMessage: "Forgot password resend failed");
}
