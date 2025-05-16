import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_pass_verify_req.g.dart';
part 'forgot_pass_verify_req.freezed.dart';

@freezed
abstract class ForgotPassVerifyRequest with _$ForgotPassVerifyRequest{
  const factory ForgotPassVerifyRequest({
    required String email,
    required String otp,
  }) = _ForgotPassVerifyRequest;
  factory ForgotPassVerifyRequest.fromJson(Map<String, dynamic> json) => _$ForgotPassVerifyRequestFromJson(json);
}