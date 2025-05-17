import '../../../../shared/data/dto/response/base_response.dart';
import '../../../../shared/data/dto/response/base_response_data.dart';
import '../dto/req/forgot_pass/forgot_pass.dart';
import '../dto/req/forgot_pass/forgot_pass_verify.dart';
import '../dto/req/forgot_pass/reset_pass.dart';
import '../dto/req/login/login_request.dart';
import '../dto/req/signup/signup_request.dart';
import '../dto/req/signup/signup_verify_request.dart';
import '../dto/res/forgot_pass/verify.dart';
import '../dto/res/login/login_data.dart';
import '../dto/res/login/login_verify_data.dart';

abstract interface class IAuthRepo {
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
