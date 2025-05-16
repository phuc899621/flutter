import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify.freezed.dart';
part 'verify.g.dart';

@freezed
abstract class ForgotPassData with _$ForgotPassData {
  const factory ForgotPassData({required String resetToken}) =
      _ForgotPassVerifyData;
  factory ForgotPassData.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassDataFromJson(json);
}
