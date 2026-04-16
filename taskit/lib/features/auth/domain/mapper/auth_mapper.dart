import 'package:taskit/features/auth/data/dto/req/signup/signup_request.dart';
import 'package:taskit/features/auth/data/dto/res/forgot_pass/verify.dart';

import '../../../../shared/data/dto/response/base_response.dart';
import '../entities/forgot_pass/forgot_pass_verify.dart';
import '../entities/signup/signup_entity.dart';

abstract interface class AuthEntityMapper {
  ForgotPassVerifyEntity toForgotPassVerifyEntity(
    BaseResponse<ForgotPassData> data,
  );

  SignupRegisterRequest toSignupRegisterRequest(SignupRegisterEntity data);

  SignupResendRequest toSignupResendRequest(SignupResendEntity data);

  SignupVerifyRequest toSignupVerifyRequest(SignupVerifyEntity data);
}
