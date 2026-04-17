import 'package:multiple_result/multiple_result.dart';

import '../../../../shared/exception/failure.dart';
import '../../data/dto/req/login/login_request.dart';
import '../entities/forgot_pass/forgot_pass_entity.dart';
import '../entities/signup/signup_entity.dart';

abstract interface class AuthService {
  Future<Result<void, Failure>> login(LoginRequest data);

  Future<Result<void, Failure>> checkLogin();

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
