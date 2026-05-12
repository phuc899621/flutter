import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/domain/usecases/params/login_params.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/auth_repo_impl.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LoginUseCase(authRepo);
});

class LoginUseCase extends FutureUseCase<void, CredentialsLoginParams> {
  final AuthRepo _repo;

  LoginUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(CredentialsLoginParams params) =>
      runSafe(() => _repo.login(params.toEntity()));
}
