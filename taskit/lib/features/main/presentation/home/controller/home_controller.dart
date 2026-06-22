import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/main/presentation/home/state/home_state.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/usecases/subtask/delete_subtask_usecase.dart';
import 'package:taskit/features/task/domain/usecases/subtask/update_subtask_status_usecase.dart';
import 'package:taskit/features/task/domain/usecases/task/delete_task_usecase.dart';
import 'package:taskit/features/task/domain/usecases/task/update_task_status_usecase.dart';
import 'package:taskit/features/task/presentation/providers/tasks_provider.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../../../shared/log/logger_provider.dart';
import '../../../../task/domain/entities/task_entity.dart';
import '../../../../user/presentation/providers/user_provider.dart';

final homeControllerProvider =
    NotifierProvider.autoDispose<HomeController, HomeState>(HomeController.new);

class HomeController extends Notifier<HomeState> {
  StreamSubscription? _timeSub;

  late final DateTime _lastCheckTime;

  @override
  HomeState build() {
    _lastCheckTime = DateTime.now().toStartOfDay();
    ref.listen(currentUserProvider, (previous, next) {
      next.whenData((user) {
        logger.d("[HomeController] User name: ${user?.name}");
        state = state.copyWith(userName: user?.name ?? 'User');
      });
    });
    ref.listen(todayTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(todayTasks: tasks);
      });
    });
    ref.listen(tomorrowTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(tomorrowTasks: tasks);
      });
    });
    ref.listen(thisWeekTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(thisWeekTasks: tasks);
      });
    });
    ref.listen(todayOverDueTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(todayOverDueTasks: tasks);
      });
    });
    ref.listen(thisWeekOverDueTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(thisWeekOverDueTasks: tasks);
      });
    });
    ref.listen(pendingTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(pendingTasks: tasks);
      });
    });
    ref.listen(completedTodayTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(todayCompletedTasks: tasks);
      });
    });
    ref.listen(completedThisWeekTasksProvider, (previous, next) {
      next.whenData((tasks) {
        state = state.copyWith(thisWeekCompletedTasks: tasks);
      });
    });

    ref.onDispose(() {
      _timeSub?.cancel();
    });
    return HomeState();
  }

  void logout() => ref.read(authControllerProvider.notifier).logout();

  void onTimeChecker(DateTime now) {
    if (!now.isSameDay(_lastCheckTime)) {
      _lastCheckTime = now.toStartOfDay();
      final userLocalId = ref.read(
        authControllerProvider.select((value) => value.user?.localId),
      );
      if (userLocalId == null) return;
      //need restart listenner, vi sao can
    }
  }

  void onCheck(TaskEntity entity) => ref
      .read(updateTaskStatusUseCaseProvider)
      .call(
        entity.copyWith(
          status: entity.status == TaskStatus.completed
              ? TaskStatus.pending
              : TaskStatus.completed,
        ),
      );

  void onSubtaskCheck(SubtaskEntity entity) =>
      ref.read(updateSubtaskStatusUseCaseProvider).call(entity);

  void onDelete(TaskEntity entity) =>
      ref.read(deleteTaskUseCaseProvider).call(entity);

  void onSubtaskDelete(SubtaskEntity entity) =>
      ref.read(deleteSubtaskUseCaseProvider).call(entity);

  void setSelectedTask(TaskEntity task) =>
      state = state.copyWith(selectedTask: task);
}
