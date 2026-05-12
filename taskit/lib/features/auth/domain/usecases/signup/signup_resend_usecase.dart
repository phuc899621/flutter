import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/domain/usecases/params/signup_params.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/signup_repo.dart';
import '../../../data/repo/signup_repo_impl.dart';

final signupResendUseCaseProvider = Provider((ref) {
  final signupRepo = ref.watch(signupRepoProvider);
  return SignupResendUseCase(signupRepo);
});

class SignupResendUseCase extends FutureUseCase<void, SignupResendParams> {
  final SignupRepo _repo;

  SignupResendUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(SignupResendParams params) async =>
      runSafe(() async {
        await _repo.signupResend(params.toEntity());
      });
}
