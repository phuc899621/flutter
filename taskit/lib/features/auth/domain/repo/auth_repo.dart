import '../../../../shared/data/dto/response/base_data.dart';
import '../../../../shared/data/dto/response/base_response.dart';
import '../../data/dto/req/forgot_pass/forgot_pass.dart';
import '../../data/dto/req/forgot_pass/forgot_pass_verify.dart';
import '../../data/dto/req/forgot_pass/reset_pass.dart';
import '../../data/dto/req/login/login_request.dart';
import '../../data/dto/req/signup/signup_request.dart';
import '../../data/dto/req/signup/signup_verify_request.dart';
import '../../data/dto/res/forgot_pass/verify.dart';
import '../../data/dto/res/login/login_data.dart';
import '../../data/dto/res/login/login_verify_data.dart';

abstract interface class AuthRepo {
  /*
  * Login
  * */
  Future<BaseResponse<LoginData>> login(LoginRequest data);
  Future<BaseResponse<LoginVerifyData>> checkLogin();
  /*
  * Sign up
  * */
  Future<BaseResponse<BaseData>> signup(SignupRequest data);
  Future<BaseResponse<BaseData>> signupVerify(SignupVerifyRequest data);
  /*
  * Forgot Password
  * */
  Future<BaseResponse<BaseData>> forgotPass(ForgotPassRequest data);
  Future<BaseResponse<ForgotPassData>> forgotPassVerify(
      ForgotPassVerifyRequest data);
  Future<BaseResponse<BaseData>> resetPass(ResetPassRequest data, String token);
}
