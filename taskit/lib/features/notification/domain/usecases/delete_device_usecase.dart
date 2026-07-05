import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/notification/data/repo/firebase_messaging_repo.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

class RemoveDeviceUseCase extends FutureUseCase<void, NoParam> {
  final FirebaseMessagingRepo _repo;

  RemoveDeviceUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(NoParam param) =>
      runSafe(() => _repo.removeDevice());
}

final removeDeviceUseCaseProvider = Provider<RemoveDeviceUseCase>(
  (ref) => RemoveDeviceUseCase(ref.watch(firebaseMessagingRepoProvider)),
);
