import 'dart:async';

import 'package:taskit/features/auth/domain/entities/forgot_pass/forgot_pass_entity.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

import '../../../user/domain/entity/user_entity.dart';
import '../entities/signup/signup_entity.dart';

abstract interface class AuthRepo {
  /*
  * Login
  * */
  Future<MessageResult> login(LoginEntity data);

  Future<UserEntity?> fetchUserLocal();

  Future<DataResult<UserEntity>> fetchUser();

  Future<MessageResult> refreshToken();

  Future<MessageResult> logout();

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
