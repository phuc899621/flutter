import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';

part 'signup_params.freezed.dart';

@freezed
abstract class SignupParams with _$SignupParams {
  const factory SignupParams.register({
    required String email,
    required String password,
  }) = SignupRegisterParams;

  const factory SignupParams.verify({
    required String email,
    required String otp,
  }) = SignupVerifyParams;

  const factory SignupParams.resend({required String email}) =
      SignupResendParams;
}

extension SignupRegisterParamsX on SignupRegisterParams {
  SignupRegisterEntity toEntity() =>
      SignupRegisterEntity(email: email, password: password);
}

extension SignupVerifyParamsX on SignupVerifyParams {
  SignupVerifyEntity toEntity() => SignupVerifyEntity(email: email, otp: otp);
}

extension SignupResendParamsX on SignupResendParams {
  SignupResendEntity toEntity() => SignupResendEntity(email: email);
}
