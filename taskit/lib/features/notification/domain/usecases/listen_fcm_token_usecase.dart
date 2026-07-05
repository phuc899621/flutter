import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/domain/usecase/stream_usecase.dart';

import '../../data/repo/firebase_messaging_repo.dart';

final listenFcmTokenUsecaseProvider = Provider<ListenFcmTokenUsecase>(
  (ref) => ListenFcmTokenUsecase(ref.watch(firebaseMessagingRepoProvider)),
);

class ListenFcmTokenUsecase extends StreamUseCase<String, NoParam> {
  final FirebaseMessagingRepo _repo;

  ListenFcmTokenUsecase(this._repo);

  @override
  Stream<String> call(NoParam params) => _repo.onTokenRefresh();
}
