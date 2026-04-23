import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';

import '../../application/task_service.dart';

final categoryListProvider = StreamProvider.autoDispose((ref) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;

  if (user == null) return Stream.value([]);

  return ref.watch(taskServiceProvider).watchAllCategories(user.localId);
});
