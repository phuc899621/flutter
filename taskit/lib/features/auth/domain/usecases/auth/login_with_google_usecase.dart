import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';

import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/auth_repo_impl.dart';

final loginWithGoogleUseCaseProvider = Provider<LoginWithGoogleUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LoginWithGoogleUseCase(authRepo);
});

class LoginWithGoogleUseCase extends UseCase<void, NoParam> {
  final AuthRepo _repo;

  LoginWithGoogleUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(NoParam params) =>
      runSafe(() => _repo.loginWithGoogle());
}
