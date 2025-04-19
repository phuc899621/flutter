import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_pass_req.g.dart';
part 'forgot_pass_req.freezed.dart';

@freezed
abstract class ForgotPassRequest with _$ForgotPassRequest {
  const factory ForgotPassRequest({
    required String email,
  }) = _ForgotPassRequest;
  factory ForgotPassRequest.fromJson(Map<String, dynamic> json) => _$ForgotPassRequestFromJson(json);
}