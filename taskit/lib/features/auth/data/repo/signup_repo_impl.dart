import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/repo/signup_repo.dart';
import 'package:taskit/features/auth/data/source/remote/signup_api.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/data/mapper/result_mapper.dart';
import '../../../../shared/domain/entities/message_result.dart';
import '../../domain/entities/signup/signup_entity.dart';
import '../mapper/signup_mapper.dart';

final signupRepoProvider = Provider<SignupRepo>((ref) {
  final signup = ref.watch(signupApiProvider);
  return SignupRepoImpl(signup);
});

class SignupRepoImpl with DioExceptionMapper implements SignupRepo {
  final SignupApi _api;

  SignupRepoImpl(this._api);

  @override
  Future<MessageResult> signup(SignupRegisterEntity entity) => callSafe(
    () async => (await _api.signup(entity.toDto())).toResult(),
    errorMessage: "An unexpected error occurred when sign up",
  );

  @override
  Future<MessageResult> signupVerify(SignupVerifyEntity entity) => callSafe(
    () async => (await _api.signupVerify(entity.toDto())).toResult(),
    errorMessage: "An unexpected error occurred when verify signup",
  );

  @override
  Future<MessageResult> signupResend(SignupResendEntity entity) => callSafe(
    () async => (await _api.signupResend(entity.toDto())).toResult(),
    errorMessage: "An unexpected error occurred when resend signup",
  );
}
