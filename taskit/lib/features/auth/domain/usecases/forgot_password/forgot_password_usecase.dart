import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/forgot_password_repo.dart';
import 'package:taskit/features/auth/domain/usecases/params/forgot_password_params.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/forgot_password_repo_impl.dart';

final forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
  final forgotPasswordRepo = ref.watch(forgotPasswordRepoProvider);
  return ForgotPasswordUseCase(forgotPasswordRepo);
});

class ForgotPasswordUseCase extends FutureUseCase<void, ForgotPasswordParams> {
  final ForgotPasswordRepo _repo;

  ForgotPasswordUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(ForgotPasswordParams params) async {
    return runSafe(() async {
      await _repo.forgotPassword(params.toEntity());
    });
  }
}
