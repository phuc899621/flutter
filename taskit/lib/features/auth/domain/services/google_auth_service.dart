import 'package:multiple_result/multiple_result.dart';

import '../../../../shared/exception/failure.dart';

abstract class GoogleAuthService {
  Future<Result<String, Failure>> getGoogleIdToken();

  Future<void> logout();
}
