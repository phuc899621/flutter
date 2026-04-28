import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/shared/data/source/remote/google_sign_in.dart';
import 'package:taskit/shared/exception/failure.dart';

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
      await _googleSignIn.signOut();
      await Future.delayed(const Duration(milliseconds: 100));

      final GoogleSignInAccount? account;
      if (_googleSignIn.supportsAuthenticate()) {
        account = await _googleSignIn.authenticate();
      } else {
        account = null;
      }
      if (account == null) return Error(Failure(message: 'Sign in cancelled'));

      final idToken = account.authentication.idToken;
      if (idToken == null) return Error(Failure(message: 'idToken is null'));
      return Success(idToken);
    } catch (e) {
      return Error(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> logout() => _googleSignIn.signOut();
}
