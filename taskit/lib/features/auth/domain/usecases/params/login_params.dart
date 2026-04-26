import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';

part 'login_params.freezed.dart';

@freezed
abstract class LoginParams with _$LoginParams {
  const factory LoginParams.credentials({
    required String email,
    required String password,
  }) = CredentialsLoginParams;

  const factory LoginParams.google({required String token}) = GoogleLoginParams;
}

extension CredentialsLoginParamsMapper on CredentialsLoginParams {
  CredentialsLoginEntity toEntity() =>
      CredentialsLoginEntity(email: email, password: password);
}

extension GoogleLoginParamsMapper on GoogleLoginParams {
  GoogleLoginEntity toEntity() => GoogleLoginEntity(token: token);
}
