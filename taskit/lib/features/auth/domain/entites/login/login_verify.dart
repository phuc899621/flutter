import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_verify.freezed.dart';

@freezed
abstract class LoginVerifyModel with _$LoginVerifyModel {
  const factory LoginVerifyModel({
    required String name,
    required String gmail,
  }) = _LoginVerifyModel;
}
