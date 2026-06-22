import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/task/data/repo/task_repo_impl.dart';
import 'package:taskit/features/task/domain/usecases/task/watch_task_by_local_id_usecase.dart';
import 'package:taskit/features/task/domain/usecases/task/watch_tasks_by_due_date.dart';
import 'package:taskit/features/task/domain/usecases/task/watch_tasks_usecase.dart';

import '../../domain/entities/task_entity.dart';

final tasksProvider = StreamProvider.autoDispose<List<TaskEntity>>((ref) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;

  if (user == null) return Stream.value([]);

  return ref
      .watch(watchTasksUseCaseProvider)
      .call(WatchTasksParam(userLocalId: user.localId, filter: TaskFilter.all));
});

final todayTasksProvider = StreamProvider.autoDispose<List<TaskEntity>>((ref) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;
  if (user == null) return Stream.value([]);
  return ref
      .watch(watchTasksUseCaseProvider)
      .call(
        WatchTasksParam(userLocalId: user.localId, filter: TaskFilter.today),
      );
});

final tomorrowTasksProvider = StreamProvider.autoDispose<List<TaskEntity>>((
  ref,
) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;
  if (user == null) return Stream.value([]);
  return ref
      .watch(watchTasksUseCaseProvider)
      .call(
        WatchTasksParam(userLocalId: user.localId, filter: TaskFilter.tomorrow),
      );
});
final thisWeekTasksProvider = StreamProvider.autoDispose<List<TaskEntity>>((
  ref,
) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;
  if (user == null) return Stream.value([]);
  return ref
      .watch(watchTasksUseCaseProvider)
      .call(
        WatchTasksParam(userLocalId: user.localId, filter: TaskFilter.thisWeek),
      );
});
final pendingTasksProvider = StreamProvider.autoDispose<List<TaskEntity>>((
  ref,
) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;
  if (user == null) return Stream.value([]);
  return ref
      .watch(watchTasksUseCaseProvider)
      .call(
        WatchTasksParam(userLocalId: user.localId, filter: TaskFilter.pending),
      );
});
final completedTodayTasksProvider =
    StreamProvider.autoDispose<List<TaskEntity>>((ref) {
      final authState = ref.watch(authControllerProvider);
      final user = authState.user;
      if (user == null) return Stream.value([]);
      return ref
          .watch(watchTasksUseCaseProvider)
          .call(
            WatchTasksParam(
              userLocalId: user.localId,
              filter: TaskFilter.completedToday,
            ),
          );
    });
final completedThisWeekTasksProvider =
    StreamProvider.autoDispose<List<TaskEntity>>((ref) {
      final authState = ref.watch(authControllerProvider);
      final user = authState.user;
      if (user == null) return Stream.value([]);
      return ref
          .watch(watchTasksUseCaseProvider)
          .call(
            WatchTasksParam(
              userLocalId: user.localId,
              filter: TaskFilter.completedThisWeek,
            ),
          );
    });
final todayOverDueTasksProvider = StreamProvider.autoDispose<List<TaskEntity>>((
  ref,
) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;
  if (user == null) return Stream.value([]);
  return ref
      .watch(watchTasksUseCaseProvider)
      .call(
        WatchTasksParam(
          userLocalId: user.localId,
          filter: TaskFilter.todayOverDue,
        ),
      );
});
final thisWeekOverDueTasksProvider =
    StreamProvider.autoDispose<List<TaskEntity>>((ref) {
      final authState = ref.watch(authControllerProvider);
      final user = authState.user;
      if (user == null) return Stream.value([]);
      return ref
          .watch(watchTasksUseCaseProvider)
          .call(
            WatchTasksParam(
              userLocalId: user.localId,
              filter: TaskFilter.thisWeekOverDue,
            ),
          );
    });

final taskByLocalIdProvider = StreamProvider.autoDispose
    .family<TaskEntity?, int>((ref, localId) {
      final authState = ref.watch(authControllerProvider);
      final user = authState.user;
      if (user == null) return Stream.value(null);
      return ref
          .watch(watchTaskByLocalIdUseCaseProvider)
          .call(
            WatchTaskByLocalIdParam(
              userLocalId: user.localId,
              localId: localId,
            ),
          );
    });

final tasksByDueDateProvider = StreamProvider.autoDispose
    .family<List<TaskEntity>, DateTime?>((ref, dueDate) {
      final authState = ref.watch(authControllerProvider);
      final user = authState.user;
      if (user == null) return Stream.value([]);
      return ref
          .watch(watchTasksByDueDateUseCaseProvider)
          .call(
            WatchTasksByDueDateParam(
              userLocalId: user.localId,
              dueDate: dueDate,
            ),
          );
    });
