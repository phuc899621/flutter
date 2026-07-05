import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/notification/data/repo/firebase_messaging_repo.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

class UpdateDeviceUseCase extends FutureUseCase<void, String> {
  final FirebaseMessagingRepo _repo;

  UpdateDeviceUseCase(this._repo);

  @override
  Future<Result<void, Failure>> call(String params) =>
      runSafe(() => _repo.updateDevice(params));
}

final updateDeviceUseCaseProvider = Provider<UpdateDeviceUseCase>(
  (ref) => UpdateDeviceUseCase(ref.watch(firebaseMessagingRepoProvider)),
);
