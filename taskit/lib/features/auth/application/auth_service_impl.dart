import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/mapper/auth_mapper_impl.dart';
import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';
import 'package:taskit/features/auth/domain/mapper/auth_mapper.dart';
import 'package:taskit/features/auth/domain/repo/auth_repo.dart';
import 'package:taskit/shared/data/mapper/base_model_mapper_impl.dart';
import 'package:taskit/shared/domain/mapper/base_model_mapper.dart';
import 'package:taskit/shared/exception/failure.dart';
import 'package:taskit/shared/utils/result_handler.dart';

import '../../../shared/domain/model/base_model.dart';
import '../data/dto/req/forgot_pass/forgot_pass.dart';
import '../data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../data/dto/req/forgot_pass/reset_pass.dart';
import '../data/repo/auth_repo_impl.dart';
import '../domain/entities/forgot_pass/forgot_pass_verify.dart';
import '../domain/service/auth_service.dart';

final authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  final authEntityMapper = ref.watch(authEntityMapperProvider);
  final baseModelMapper = ref.watch(baseModelMapperProvider);
  return AuthServiceImpl(authRepo, authEntityMapper, baseModelMapper);
});

class AuthServiceImpl with ResultHandler implements AuthService {
  final AuthRepo _authRepo;
  final AuthEntityMapper _authEntityMapper;
  final BaseModelMapper _baseModelMapper;

  AuthServiceImpl(
    this._authRepo,
    this._authEntityMapper,
    this._baseModelMapper,
  );

  /*
  * Login
  * */
  @override
  Future<Result<void, Failure>> login(LoginRequest data) async =>
      runSafe(() async {
        await _authRepo.login(data);
      });

  @override
  Future<Result<void, Failure>> checkLogin() async => runSafe(() async {
    await _authRepo.checkLogin();
  });

  /*
  * Sign Up
  * */
  @override
  Future<Result<void, Failure>> signup(SignupRegisterEntity data) async =>
      runSafe(() async {
        final request = _authEntityMapper.toSignupRegisterRequest(data);
        await _authRepo.signup(request);
      });

  @override
  Future<Result<void, Failure>> signupVerify(SignupVerifyEntity data) async =>
      runSafe(() async {
        await _authRepo.signupVerify(
          _authEntityMapper.toSignupVerifyRequest(data),
        );
      });

  @override
  Future<Result<void, Failure>> signupResend(SignupResendEntity data) async =>
      runSafe(() async {
        await _authRepo.signupResend(
          _authEntityMapper.toSignupResendRequest(data),
        );
      });

  /*
  * Forgot Password
  * */
  @override
  Future<Result<void, Failure>> forgotPass(ForgotPassRequest data) async =>
      runSafe(() async {
        await _authRepo.forgotPass(data);
      });

  @override
  Future<Result<BaseModel, Failure>> resetPass(
    ResetPassRequest data,
    String resetToken,
  ) async => runSafe(() async {
    final response = await _authRepo.resetPass(data, resetToken);
    return _baseModelMapper.map(response);
  });

  @override
  Future<Result<ForgotPassVerifyEntity, Failure>> forgotPassVerify(
    ForgotPassVerifyRequest data,
  ) async => runSafe(() async {
    final response = await _authRepo.forgotPassVerify(data);
    return _authEntityMapper.toForgotPassVerifyEntity(response);
  });
}
