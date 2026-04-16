import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request.freezed.dart';
part 'signup_request.g.dart';

@freezed
abstract class SignupRequest with _$SignupRequest {
  const factory SignupRequest.register({
    required String email,
    required String password,
  }) = SignupRegisterRequest;

  const factory SignupRequest.verify({
    required String email,
    required String otp,
  }) = SignupVerifyRequest;

  const factory SignupRequest.resend({required String email}) =
      SignupResendRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);
}
