import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/domain/entites/signup/signup_verify_model.dart';

import '../../../../shared/exception/failure.dart';
import '../../data/dto/req/forgot_pass/forgot_pass.dart';
import '../../data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../../data/dto/req/forgot_pass/reset_pass.dart';
import '../../data/dto/req/login/login_request.dart';
import '../../data/dto/req/signup/signup_request.dart';
import '../../data/dto/req/signup/signup_verify_request.dart';
import '../entites/forgot_pass/forgot_pass_verify.dart';
import '../entites/signup/signup_model.dart';

abstract interface class AuthService {
  Future<Result<void, Failure>> login(LoginRequest data);
  Future<Result<void, Failure>> checkLogin();

  Future<Result<void, Failure>> signup(SignupModel data);
  Future<Result<void, Failure>> signupVerify(SignupVerifyModel data);

  Future<Result<void, Failure>> forgotPass(ForgotPassRequest data);
  Future<Result<ForgotPassVerifyEntity, Failure>> forgotPassVerify(
      ForgotPassVerifyRequest data);
  Future<Result<void, Failure>> resetPass(
      ResetPassRequest data, String resetToken);
}
