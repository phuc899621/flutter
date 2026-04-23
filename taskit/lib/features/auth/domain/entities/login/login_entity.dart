import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  const factory LoginEntity.credentials({
    required String email,
    required String password,
  }) = CredentialsLoginEntity;

  const factory LoginEntity.google({required String token}) = GoogleLoginEntity;
}
