import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskit/shared/log/logger_provider.dart';

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn.instance;
});

final googleInitProvider = FutureProvider<void>((ref) async {
  final google = ref.read(googleSignInProvider);
  logger.w('Google init');
  await google.initialize(
    serverClientId:
        '825597665142-91sqbcsiiu6hbkhhdi7aab322epcu1fa.apps.googleusercontent.com',
  );

  //await google.attemptLightweightAuthentication();
});
