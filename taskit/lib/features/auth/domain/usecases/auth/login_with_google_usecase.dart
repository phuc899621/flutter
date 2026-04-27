import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/domain/services/google_auth_service.dart';
import 'package:taskit/features/auth/domain/services/google_auth_service_impl.dart';

import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/auth_repo_impl.dart';

final loginWithGoogleUseCaseProvider = Provider<LoginWithGoogleUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  final googleService = ref.watch(googleAuthServiceProvider);
  return LoginWithGoogleUseCase(authRepo, googleService);
});

class LoginWithGoogleUseCase extends UseCase<void, NoParam> {
  final AuthRepo _repo;
  final GoogleAuthService _googleService;

  LoginWithGoogleUseCase(this._repo, this._googleService);

  @override
  Future<Result<void, Failure>> call(NoParam params) => runSafe(() async {
    final idTokenResult = await _googleService.getGoogleIdToken();
    return idTokenResult.when(
      (idToken) => _repo.loginWithGoogle(idToken),
      (failure) => Error(failure),
    );
  });
}
