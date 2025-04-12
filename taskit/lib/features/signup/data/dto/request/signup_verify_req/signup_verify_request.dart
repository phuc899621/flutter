import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_verify_request.freezed.dart';
part 'signup_verify_request.g.dart';

@freezed
abstract class SignupVerifyRequest with _$SignupVerifyRequest {
  const factory SignupVerifyRequest({
    required String email,
    required String otp,
  }) = _SignupVerifyRequest;

  factory SignupVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupVerifyRequestFromJson(json);
}