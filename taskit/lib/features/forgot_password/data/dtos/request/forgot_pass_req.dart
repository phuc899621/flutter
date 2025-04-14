import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_pass_req.g.dart';
part 'forgot_pass_req.freezed.dart';

@freezed
abstract class ForgotPassRequest with _$ForgotPassRequest {
  const factory ForgotPassReq({
    required String email,
  }) = _ForgotPassReq;
  factory ForgotPassRequest.fromJson(Map<String, dynamic> json) => _$ForgotPassRequestFromJson(json);
}