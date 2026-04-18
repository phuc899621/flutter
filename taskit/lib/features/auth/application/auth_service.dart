import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';

import '../../../shared/exception/failure.dart';
import '../domain/entities/forgot_pass/forgot_pass_entity.dart';
import '../domain/entities/signup/signup_entity.dart';

abstract interface class AuthService {
  Future<Result<void, Failure>> login(LoginEntity data);

  Future<Result<UserEntity, Failure>> fetchUser();

  Future<Result<UserEntity?, Failure>> fetchUserLocal();

  Future<Result<void, Failure>> refreshToken();

  Future<Result<void, Failure>> logout();

  Future<Result<void, Failure>> signup(SignupRegisterEntity data);

  Future<Result<void, Failure>> signupVerify(SignupVerifyEntity data);

  Future<Result<void, Failure>> signupResend(SignupResendEntity data);

  Future<Result<void, Failure>> forgotPass(ForgotPasswordEntity data);

  Future<Result<ForgotPasswordVerifyResultEntity, Failure>> forgotPassVerify(
    ForgotPasswordVerifyEntity data,
  );

  Future<Result<void, Failure>> forgotPassReset(ForgotPasswordResetEntity data);

  Future<Result<void, Failure>> forgotPassResend(
    ForgotPasswordResendEntity data,
  );
}
