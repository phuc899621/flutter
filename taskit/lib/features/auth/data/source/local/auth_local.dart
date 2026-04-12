import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheLogin(LoginData loginData);
}
