import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/signup_repo.dart';
import 'package:taskit/features/auth/domain/usecases/params/signup_params.dart';

import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../data/repo/signup_repo_impl.dart';

final signupVerifyUseCaseProvider = Provider((ref) {
  final signupRepo = ref.watch(signupRepoProvider);
  return SignupVerifyUseCase(signupRepo);
});

class SignupVerifyUseCase extends FutureUseCase<void, SignupVerifyParams> {
  final SignupRepo _repo;

  SignupVerifyUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(SignupVerifyParams params) =>
      runSafe(() async => await _repo.signupVerify(params.toEntity()));
}
