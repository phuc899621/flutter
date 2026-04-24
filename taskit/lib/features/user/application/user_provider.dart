import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/user/application/user_service.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../auth/presentation/auth/controller/auth_controller.dart';

final currentUserProvider = StreamProvider.autoDispose<UserEntity?>((ref) {
  final activeUser = ref.watch(
    authControllerProvider.select((value) => value.user),
  );
  logger.w('🚀 currentUserProvider: $activeUser');
  if (activeUser == null) {
    return Stream.value(null);
  }
  final userService = ref.watch(userServiceProvider);
  return userService.watchUserByLocalId(activeUser.localId);
});
