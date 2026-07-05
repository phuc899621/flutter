import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../data/repo/firebase_messaging_repo.dart';

class RequestFcmPermissionUsecase extends FutureUseCase<bool, NoParam> {
  final FirebaseMessagingRepo _repo;

  RequestFcmPermissionUsecase(this._repo);

  @override
  Future<Result<bool, Failure>> call(NoParam params) =>
      runSafe(() => _repo.requestPermission());
}

final requestFcmPermissionUsecase = Provider<RequestFcmPermissionUsecase>(
  (ref) =>
      RequestFcmPermissionUsecase(ref.watch(firebaseMessagingRepoProvider)),
);
