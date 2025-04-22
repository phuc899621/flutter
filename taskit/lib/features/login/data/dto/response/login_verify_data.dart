import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_verify_data.g.dart';
part 'login_verify_data.freezed.dart';
@freezed
abstract class LoginVerifyData with _$LoginVerifyData {
  const factory LoginVerifyData({
    required String name,
    required String email,
  })=_LoginVerifyData;
  factory LoginVerifyData.fromJson(Map<String, dynamic> json) => _$LoginVerifyDataFromJson(json);

}