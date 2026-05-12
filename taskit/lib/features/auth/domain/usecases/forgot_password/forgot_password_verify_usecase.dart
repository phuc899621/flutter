import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/forgot_password_repo.dart';
import 'package:taskit/features/auth/domain/usecases/params/forgot_password_params.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/forgot_password_repo_impl.dart';
import '../../entities/forgot_pass/forgot_pass_entity.dart';

final forgotPasswordVerifyUseCaseProvider =
    Provider<ForgotPasswordVerifyUseCase>((ref) {
      final forgotPasswordRepo = ref.watch(forgotPasswordRepoProvider);
      return ForgotPasswordVerifyUseCase(forgotPasswordRepo);
    });

class ForgotPasswordVerifyUseCase
    extends
        FutureUseCase<
          ForgotPasswordVerifyResultEntity,
          ForgotPasswordVerifyParams
        > {
  final ForgotPasswordRepo _repo;

  ForgotPasswordVerifyUseCase(this._repo);

  @override
  Future<Result<ForgotPasswordVerifyResultEntity, Failure>> call(
    ForgotPasswordVerifyParams params,
  ) => runSafe(
    () async => (await _repo.forgotPasswordVerify(params.toEntity())).data,
  );
}
