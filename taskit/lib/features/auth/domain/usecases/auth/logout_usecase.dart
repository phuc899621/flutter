import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';

import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/auth_repo_impl.dart';

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return LogoutUseCase(authRepo);
});

class LogoutUseCase extends UseCase<void, NoParam> {
  final AuthRepo _repo;

  LogoutUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(NoParam params) =>
      runSafe(() => _repo.logout());
}
