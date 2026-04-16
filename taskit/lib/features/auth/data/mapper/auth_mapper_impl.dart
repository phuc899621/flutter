import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/signup/signup_request.dart';
import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';
import 'package:taskit/features/auth/domain/mapper/auth_mapper.dart';

import '../../../../shared/data/dto/response/base_response.dart';
import '../../../../shared/helpers/base_response_helper.dart';
import '../../domain/entities/forgot_pass/forgot_pass_verify.dart';
import '../dto/res/forgot_pass/verify.dart';

class AuthEntityMapperImpl implements AuthEntityMapper {
  @override
  ForgotPassVerifyEntity toForgotPassVerifyEntity(
    BaseResponse<ForgotPassData> data,
  ) {
    final responseData = BaseResponseHelper.requireData(data);
    return ForgotPassVerifyEntity(resetToken: responseData.resetToken);
  }

  @override
  SignupRegisterRequest toSignupRegisterRequest(SignupRegisterEntity data) =>
      SignupRegisterRequest(email: data.email, password: data.password);

  @override
  SignupVerifyRequest toSignupVerifyRequest(SignupVerifyEntity data) =>
      SignupVerifyRequest(email: data.email, otp: data.otp);

  @override
  SignupResendRequest toSignupResendRequest(SignupResendEntity data) =>
      SignupResendRequest(email: data.email);
}

final authEntityMapperProvider = Provider.autoDispose<AuthEntityMapper>(
  (ref) => AuthEntityMapperImpl(),
);
