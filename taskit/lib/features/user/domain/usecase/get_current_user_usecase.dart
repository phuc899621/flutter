import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/domain/usecase/usecase.dart';

import '../../../../shared/exception/failure.dart';
import '../../data/repo/user_repo.dart';
import '../../data/repo/user_repo_impl.dart';
import '../entity/user_entity.dart';

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>(
  (ref) => GetCurrentUserUseCase(ref.read(userRepoProvider)),
);

class GetCurrentUserUseCase extends UseCase<void, NoParam> {
  final UserRepo _repo;

  GetCurrentUserUseCase(this._repo);

  @override
  Future<Result<UserEntity?, Failure>> call(NoParam params) =>
      runSafe(() async => _repo.getCurrentUser());
}
