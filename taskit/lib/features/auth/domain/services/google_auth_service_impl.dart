import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/shared/data/source/remote/google_sign_in.dart';
import 'package:taskit/shared/exception/failure.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import 'google_auth_service.dart';

final googleAuthServiceProvider = Provider<GoogleAuthService>((ref) {
  final googleSignIn = ref.watch(googleSignInProvider);
  return GoogleAuthServiceImpl(googleSignIn);
});

class GoogleAuthServiceImpl implements GoogleAuthService {
  final GoogleSignIn _googleSignIn;

  GoogleAuthServiceImpl(this._googleSignIn);

  @override
  Future<Result<String, Failure>> getGoogleIdToken() async {
    try {
      logger.i('[GoogleAuthService] Starting Google sign-in process');
      await _googleSignIn.signOut();
      await Future.delayed(const Duration(milliseconds: 100));

      final GoogleSignInAccount? account;
      if (_googleSignIn.supportsAuthenticate()) {
        logger.t('[GoogleAuthService] Authenticating with Google process');
        account = await _googleSignIn.authenticate();
      } else {
        logger.t('[GoogleAuthService] Google sign-in not supported');
        account = null;
      }
      if (account == null) {
        logger.w('[GoogleAuthService] Sign in cancelled');
        return Error(Failure(message: 'Sign in cancelled'));
      }
      logger.d(
        '[GoogleAuthService] Account selected ${account.email}. Fetching token',
      );

      final idToken = account.authentication.idToken;
      if (idToken == null) {
        logger.e('[GoogleAuthService] idToken is null');
        return Error(Failure(message: 'idToken is null'));
      }
      logger.d('[GoogleAuthService] idToken fetched: $idToken');
      return Success(idToken);
    } catch (e, s) {
      logger.e('[GoogleAuthService] Error during Google sign-in: $e\n$s');
      return Error(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    logger.i('[GoogleAuthService] Starting Google sign-out process');
    try {
      await _googleSignIn.signOut();
      logger.d('[GoogleAuthService] Google sign-out successful');
    } catch (e, s) {
      logger.e('[GoogleAuthService] Error during Google sign-out: $e\n$s');
    }
  }
}
