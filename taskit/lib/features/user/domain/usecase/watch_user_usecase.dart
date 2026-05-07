import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/usecase/stream_usecase.dart';
import '../../../../shared/log/logger_provider.dart';
import '../../data/repo/user_repo.dart';
import '../entity/user_entity.dart';

final watchUserUseCaseProvider = Provider<WatchUserUseCase>(
  (ref) => WatchUserUseCase(ref.read(userRepoProvider)),
);

class WatchUserUseCase extends StreamUseCase<UserEntity?, int> {
  final UserRepo _userRepo;

  WatchUserUseCase(this._userRepo);

  @override
  Stream<UserEntity?> call(int params) {
    logger.v('WatchUserUseCase: Opening DB stream for user localId: $params');
    return _userRepo.watchUserByLocalId(params);
  }
}
