import 'package:taskit/features/auth/data/dto/req/signup/signup_request.dart';
import 'package:taskit/features/auth/data/dto/req/signup/signup_verify_request.dart';
import 'package:taskit/features/auth/data/dto/res/forgot_pass/verify.dart';

import '../../../../shared/data/dto/response/base_response.dart';
import '../entites/forgot_pass/forgot_pass_verify.dart';
import '../entites/signup/signup_model.dart';
import '../entites/signup/signup_verify_model.dart';

abstract interface class AuthEntityMapper {
  ForgotPassVerifyEntity mapToForgotPassVerifyEntity(
    BaseResponse<ForgotPassData> data,
  );

  SignupRequest mapToSignupRequest(SignupModel data);

  SignupVerifyRequest mapToSignupVerifyRequest(SignupVerifyModel data);
}
