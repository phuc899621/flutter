import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/signup/signup_request.dart';
import 'package:taskit/features/auth/data/dto/req/signup/signup_verify_request.dart';
import 'package:taskit/features/auth/domain/entites/signup/signup_model.dart';
import 'package:taskit/features/auth/domain/mapper/auth_mapper.dart';

import '../../../../shared/data/dto/response/base_response.dart';
import '../../../../shared/helpers/base_response_helper.dart';
import '../../domain/entites/forgot_pass/forgot_pass_verify.dart';
import '../../domain/entites/signup/signup_verify_model.dart';
import '../dto/res/forgot_pass/verify.dart';

class AuthEntityMapperImpl implements AuthEntityMapper {
  @override
  ForgotPassVerifyEntity mapToForgotPassVerifyEntity(
    BaseResponse<ForgotPassData> data,
  ) {
    final responseData = BaseResponseHelper.requireData(data);
    return ForgotPassVerifyEntity(resetToken: responseData.resetToken);
  }

  @override
  SignupRequest mapToSignupRequest(SignupModel data) =>
      SignupRequest(email: data.email, password: data.password);

  @override
  SignupVerifyRequest mapToSignupVerifyRequest(SignupVerifyModel data) =>
      SignupVerifyRequest(email: data.email, otp: data.otp);
}

final authEntityMapperProvider = Provider.autoDispose<AuthEntityMapper>(
  (ref) => AuthEntityMapperImpl(),
);
