import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_entity.freezed.dart';

@freezed
abstract class SignupEntity with _$SignupEntity {
  const factory SignupEntity.register({
    required String email,
    required String password,
  }) = SignupRegisterEntity;

  const factory SignupEntity.verify({
    required String email,
    required String otp,
  }) = SignupVerifyEntity;

  const factory SignupEntity.resend({required String email}) =
      SignupResendEntity;

  static const initialRegister = SignupRegisterEntity(email: '', password: '');
  static const initialVerify = SignupVerifyEntity(email: '', otp: '');
  static const initialResend = SignupResendEntity(email: '');
}
