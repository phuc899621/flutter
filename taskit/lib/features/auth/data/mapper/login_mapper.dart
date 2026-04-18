import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';

import '../dto/req/login/login_request.dart';

extension LoginEntityMapper on LoginEntity {
  LoginRequest toDto() => LoginRequest(email: email, password: password);
}
