import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_pass_verify_res.g.dart';
part 'forgot_pass_verify_res.freezed.dart';

@freezed
abstract class ForgotPassVerifyData with _$ForgotPassVerifyData{
  const factory ForgotPassVerifyData({required String resetToken
  }) = _ForgotPassVerifyData;
  factory ForgotPassVerifyData.fromJson(Map<String, dynamic> json) => _$ForgotPassVerifyDataFromJson(json);
}