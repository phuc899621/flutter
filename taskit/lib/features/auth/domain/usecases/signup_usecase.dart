import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/auth/data/repo/signup_repo_impl.dart';
import 'package:taskit/features/auth/domain/usecases/params/signup_params.dart';
import 'package:taskit/shared/domain/usecase/usecase.dart';

import '../../../../shared/exception/failure.dart';
import '../../data/repo/signup_repo.dart';

final signupUseCaseProvider = Provider((ref) {
  final signupRepo = ref.watch(signupRepoProvider);
  return SignupUseCase(signupRepo);
});

class SignupUseCase extends UseCase<void, SignupRegisterParams> {
  final SignupRepo _api;

  SignupUseCase(this._api);

  @override
  Future<Result<void, Failure>> call(SignupRegisterParams params) =>
      runSafe(() {
        final entity = params.toEntity();
        return _api.signup(entity);
      });
}
