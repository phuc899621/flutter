import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/domain/usecase/watch_user_usecase.dart';

import '../../../../shared/log/logger_provider.dart';
import '../../../auth/presentation/auth/controller/auth_controller.dart';
import '../../domain/entity/user_entity.dart';

final currentUserProvider = StreamProvider.autoDispose<UserEntity?>((ref) {
  logger.i("[currentUserProvider] Init Watching user");
  final activeUser = ref.watch(
    authControllerProvider.select((value) => value.user),
  );
  if (activeUser == null) {
    logger.d("[currentUserProvider] No active user found");
    return Stream.value(null);
  }
  logger.d("[currentUserProvider] Active user found: ${activeUser.localId}");
  return ref.watch(watchUserUseCaseProvider).call(activeUser.localId);
});
