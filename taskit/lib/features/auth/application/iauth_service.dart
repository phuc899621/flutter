import 'package:multiple_result/multiple_result.dart';

import '../../../shared/domain/model/base_model.dart';
import '../../../shared/exception/failure.dart';
import '../data/dto/req/forgot_pass/forgot_pass.dart';
import '../data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../data/dto/req/forgot_pass/reset_pass.dart';
import '../data/dto/req/login/login_request.dart';
import '../data/dto/req/signup/signup_request.dart';
import '../data/dto/req/signup/signup_verify_request.dart';
import '../domain/entites/forgot_pass/forgot_pass_verify.dart';

abstract interface class IAuthService {
  Future<Result<void, Failure>> login(LoginRequest data);
  Future<Result<void, Failure>> signup(SignupRequest data);
  Future<Result<void, Failure>> signupVerify(SignupVerifyRequest data);
  Future<Result<void, Failure>> checkLogin(String token);
  Future<Result<BaseModel, Failure>> forgotPass(ForgotPassRequest data);
  Future<Result<ForgotPassVerifyModel, Failure>> forgotPassVerify(
      ForgotPassVerifyRequest data);
  Future<Result<BaseModel, Failure>> resetPass(
      ResetPassRequest data, String resetToken);
}
