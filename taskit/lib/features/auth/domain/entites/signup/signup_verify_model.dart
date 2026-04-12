import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_verify_model.freezed.dart';

@freezed
abstract class SignupVerifyModel with _$SignupVerifyModel {
  const factory SignupVerifyModel({
    required String email,
    required String otp,
  }) = _SignupModel;
}
