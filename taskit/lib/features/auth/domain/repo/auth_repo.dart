import 'package:taskit/features/auth/domain/entities/forgot_pass/forgot_pass_entity.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

import '../../../../shared/data/dto/response/data_response.dart';
import '../../data/dto/req/login/login_request.dart';
import '../../data/dto/res/login/login_data.dart';
import '../../data/dto/res/login/login_verify_data.dart';
import '../entities/signup/signup_entity.dart';

abstract interface class AuthRepo {
  /*
  * Login
  * */
  Future<DataResponse<LoginData>> login(LoginRequest data);

  Future<DataResponse<LoginVerifyData>> checkLogin();

  /*
  * Sign up
  * */
  Future<MessageResult> signup(SignupRegisterEntity data);

  Future<MessageResult> signupVerify(SignupVerifyEntity data);

  Future<MessageResult> signupResend(SignupResendEntity data);

  /*
  * Forgot Password
  * */
  Future<MessageResult> forgotPass(ForgotPasswordEntity data);

  Future<DataResult<ForgotPasswordVerifyResultEntity>> forgotPassVerify(
    ForgotPasswordVerifyEntity data,
  );

  Future<MessageResult> forgotPassResend(ForgotPasswordResendEntity data);

  Future<MessageResult> forgotPassReset(ForgotPasswordResetEntity data);
}
