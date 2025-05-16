import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_verify.freezed.dart';
part 'forgot_pass_verify.g.dart';

@freezed
abstract class ForgotPassVerifyRequest with _$ForgotPassVerifyRequest {
  const factory ForgotPassVerifyRequest({
    required String email,
    required String otp,
  }) = _ForgotPassVerifyRequest;
  factory ForgotPassVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassVerifyRequestFromJson(json);
}
