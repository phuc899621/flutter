import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../data/repo/firebase_messaging_repo.dart';

class GetFcmTokenUsecase extends FutureUseCase<String?, NoParam> {
  final FirebaseMessagingRepo _repo;

  GetFcmTokenUsecase(this._repo);

  @override
  Future<Result<String?, Failure>> call(NoParam params) =>
      runSafe(() => _repo.getToken());
}

final getFcmTokenUseCaseProvider = Provider<GetFcmTokenUsecase>(
  (ref) => GetFcmTokenUsecase(ref.watch(firebaseMessagingRepoProvider)),
);
