import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/forgot_password_repo.dart';
import 'package:taskit/features/auth/domain/usecases/params/forgot_password_params.dart';

import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/forgot_password_repo_impl.dart';

final forgotPasswordResendUseCaseProvider =
    Provider<ForgotPasswordResendUseCase>((ref) {
      final forgotPasswordRepo = ref.watch(forgotPasswordRepoProvider);
      return ForgotPasswordResendUseCase(forgotPasswordRepo);
    });

class ForgotPasswordResendUseCase
    extends UseCase<void, ForgotPasswordResendParams> {
  final ForgotPasswordRepo _repo;

  ForgotPasswordResendUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(ForgotPasswordResendParams params) =>
      runSafe(
        () async => (await _repo.forgotPasswordResend(params.toEntity())),
      );
}
