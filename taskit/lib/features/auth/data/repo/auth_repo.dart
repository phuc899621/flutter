import 'dart:async';

import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

abstract interface class AuthRepo {
  /*
  * Login
  * */
  Future<MessageResult> login(CredentialsLoginEntity data);

  Future<MessageResult> loginWithGoogle(String idToken);

  Future<MessageResult> refreshToken();

  Future<MessageResult> logout();
}
