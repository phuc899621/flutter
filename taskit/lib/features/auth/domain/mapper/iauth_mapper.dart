import '../../../../shared/data/dto/response/base_response.dart';
import '../../data/dto/res/forgot_pass/verify.dart';
import '../../data/dto/res/login/login_data.dart';
import '../../data/dto/res/login/login_verify_data.dart';
import '../../data/dto/res/signup/signup_data.dart';
import '../entites/forgot_pass/forgot_pass_verify.dart';
import '../entites/login/login.dart';
import '../entites/login/login_verify.dart';
import '../entites/signup/signup.dart';

abstract interface class IAuthMapper {
  LoginModel mapToLoginModel(BaseResponse<LoginData> data);
  SignupModel mapToSignUpModel(BaseResponse<SignupData> data);
  LoginVerifyModel mapToLoginVerifyModel(BaseResponse<LoginVerifyData> data);
  ForgotPassVerifyModel mapToForgotPassVerifyModel(
      BaseResponse<ForgotPassData> data);
}
