import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/exception/failure.dart';
import 'package:taskit/shared/utils/result_handler.dart';

import '../data/repo/auth_repo_impl.dart';
import '../domain/entities/forgot_pass/forgot_pass_entity.dart';
import 'auth_service.dart';

final authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthServiceImpl(authRepo);
});

class AuthServiceImpl with ResultHandler implements AuthService {
  final AuthRepo _authRepo;

  AuthServiceImpl(this._authRepo);

  /*
  * Login
  * */
  @override
  Future<Result<void, Failure>> login(CredentialsLoginEntity data) async =>
      runSafe(() async {
        await _authRepo.login(data);
      });

  @override
  Future<Result<void, Failure>> loginWithGoogle() async => runSafe(() async {
    await _authRepo.loginWithGoogle();
  });

  @override
  Future<Result<UserEntity, Failure>> fetchUser() async => runSafe(() async {
    return (await _authRepo.fetchUser()).data;
  });

  @override
  Future<Result<UserEntity?, Failure>> fetchUserLocal() =>
      runSafe(() => _authRepo.fetchUserLocal());

  @override
  Future<Result<void, Failure>> refreshToken() async => runSafe(() async {
    await _authRepo.refreshToken();
  });

  @override
  Future<Result<void, Failure>> logout() async => runSafe(() async {
    await _authRepo.logout();
  });

  /*
  * Forgot Password
  * */
  @override
  Future<Result<void, Failure>> forgotPass(ForgotPasswordEntity data) async =>
      runSafe(() async {
        await _authRepo.forgotPass(data);
      });

  @override
  Future<Result<void, Failure>> forgotPassReset(
    ForgotPasswordResetEntity data,
  ) async => runSafe(() async {
    (await _authRepo.forgotPassReset(data));
  });

  @override
  Future<Result<ForgotPasswordVerifyResultEntity, Failure>> forgotPassVerify(
    ForgotPasswordVerifyEntity data,
  ) async => runSafe(() async {
    return (await _authRepo.forgotPassVerify(data)).data;
  });

  @override
  Future<Result<void, Failure>> forgotPassResend(
    ForgotPasswordResendEntity data,
  ) async => runSafe(() async {
    await _authRepo.forgotPassResend(data);
  });
}
