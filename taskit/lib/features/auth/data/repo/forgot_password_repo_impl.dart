import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/mapper/forgot_password_mapper.dart';
import 'package:taskit/features/auth/data/repo/forgot_password_repo.dart';
import 'package:taskit/features/auth/data/source/remote/forgot_password_api.dart';
import 'package:taskit/shared/data/mapper/result_mapper.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/domain/entities/data_result.dart';
import '../../../../shared/domain/entities/message_result.dart';
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
      callSafe(
        () async => (await _api.forgotPassword(data.toDto())).toResult(),
        errorMessage:
            "An unexpected error occurred when sending forgot password",
      );

  @override
  Future<MessageResult> forgotPasswordReset(
    ForgotPasswordResetEntity data,
  ) async => callSafe(
    () async => (await _api.forgotPasswordReset(data.toDto())).toResult(),
    errorMessage: "An unexpected error occurred when reset password",
  );

  @override
  Future<DataResult<ForgotPasswordVerifyResultEntity>> forgotPasswordVerify(
    ForgotPasswordVerifyEntity data,
  ) async => callSafe(
    () async {
      final response = await _api.forgotPasswordVerify(data.toDto());
      return response.toResult(response.data.toEntity());
    },
    errorMessage:
        "An unexpected error occurred when verify for forgot password",
  );

  @override
  Future<MessageResult> forgotPasswordResend(
    ForgotPasswordResendEntity data,
  ) async => callSafe(
    () async => (await _api.forgotPasswordResend(data.toDto())).toResult(),
    errorMessage:
        "An unexpected error occurred when resend otp for forgot password",
  );
}
