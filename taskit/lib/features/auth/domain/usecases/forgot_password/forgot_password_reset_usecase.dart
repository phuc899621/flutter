import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/forgot_password_repo.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/forgot_password_repo_impl.dart';
import '../params/forgot_password_params.dart';

final forgotPasswordResetUseCaseProvider = Provider<ForgotPasswordResetUseCase>(
  (ref) {
    final forgotPasswordRepo = ref.watch(forgotPasswordRepoProvider);
    return ForgotPasswordResetUseCase(forgotPasswordRepo);
  },
);

class ForgotPasswordResetUseCase
    extends FutureUseCase<void, ForgotPasswordResetParams> {
  final ForgotPasswordRepo _repo;

  ForgotPasswordResetUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(ForgotPasswordResetParams params) =>
      runSafe(() => _repo.forgotPasswordReset(params.toEntity()));
}
