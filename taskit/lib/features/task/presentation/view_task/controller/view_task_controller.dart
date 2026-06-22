import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/presentation/ui/providers/categories_provider.dart';
import 'package:taskit/features/task/domain/usecases/subtask/create_subtask_usecase.dart';
import 'package:taskit/features/task/domain/usecases/subtask/delete_subtask_usecase.dart';
import 'package:taskit/features/task/domain/usecases/subtask/update_subtask_status_usecase.dart';
import 'package:taskit/features/task/domain/usecases/task/update_task_due_date_usecase.dart';
import 'package:taskit/features/task/domain/usecases/task/update_task_title_usecase.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../auth/presentation/auth/controller/auth_controller.dart';
import '../../../../category/domain/entities/category_entity.dart';
import '../../../domain/entities/subtask_entity.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/usecases/subtask/update_subtask_title.dart';
import '../../../domain/usecases/task/update_task_category_usecase.dart';
import '../../../domain/usecases/task/update_task_description_usecase.dart';
import '../../../domain/usecases/task/update_task_priority_usecase.dart';
import '../../../domain/usecases/task/validate_task_title_input_usecase.dart';
import '../../providers/tasks_provider.dart';
import '../state/edit_task_state.dart';

final viewTaskControllerProvider =
    NotifierProvider.autoDispose<ViewTaskController, ViewTaskState>(
      ViewTaskController.new,
    );

class ViewTaskController extends Notifier<ViewTaskState> {
  StreamSubscription? _taskSub;
  late StreamSubscription _subtaskSub;
  late final ProviderSubscription _authSub;

  @override
  ViewTaskState build() {
    _authSub = ref.listen(
      authControllerProvider.select((value) => value.user),
      (_, next) {
        if (next == null) {
          _taskSub?.cancel();
          _subtaskSub.cancel();
        } else {}
      },
    );
    ref.listen(categoriesProvider, (_, next) {
      next.whenData((categories) {
        state = state.copyWith(categories: categories);
      });
    });
    ref.onDispose(() {
      dispose();
    });
    return ViewTaskState();
  }

  void dispose() {
    _authSub.close();
    _taskSub?.cancel();
    _subtaskSub.cancel();
  }

  String? validateSubtaskInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Subtask title must not be empty';
    }
    return null;
  }

  void updateSubtaskStatus(SubtaskEntity entity) =>
      ref.read(updateSubtaskStatusUseCaseProvider).call(entity);

  void updateTitle(String title) {
    if (state.task == null) return;
    ref
        .read(updateTaskTitleUseCaseProvider)
        .call(state.task!.copyWith(title: title));
  }

  void updateDescription(String description) {
    if (state.task == null) return;
    ref
        .read(updateTaskDescriptionUseCaseProvider)
        .call(state.task!.copyWith(description: description));
  }

  void updatePriority(TaskPriority priority) {
    if (state.task == null) return;
    ref
        .read(updateTaskPriorityUseCaseProvider)
        .call(state.task!.copyWith(priority: priority));
  }

  void updateCategory(CategoryEntity category) {
    if (state.task == null) return;
    ref
        .read(updateTaskCategoryUseCaseProvider)
        .call(state.task!.copyWith(category: category));
  }

  void updateDueDate(DateTime? dueDate) {
    if (state.task == null) return;
    ref
        .read(updateTaskDueDateUseCaseProvider)
        .call(state.task!.copyWith(dueDate: dueDate));
  }

  void updateDueTime(TimeOfDay? dueTime) {
    final task = state.task;
    if (task == null) return;
    final dueDate = task.dueDate;
    if (dueDate == null) return;
    if (dueTime == null) {
      ref
          .read(updateTaskDueDateUseCaseProvider)
          .call(
            task.copyWith(
              dueDate: DateTime(dueDate.year, dueDate.month, dueDate.day),
              hasTime: false,
            ),
          );
      return;
    }
    ref
        .read(updateTaskDueDateUseCaseProvider)
        .call(
          task.copyWith(
            dueDate: DateTime(
              dueDate.year,
              dueDate.month,
              dueDate.day,
              dueTime.hour,
              dueTime.minute,
            ),
            hasTime: true,
          ),
        );
  }

  void updateSubtaskTitle(SubtaskEntity entity) =>
      ref.read(updateSubtaskTitleUseCaseProvider).call(entity);

  void deleteSubtask(SubtaskEntity entity) {
    ref.read(deleteSubtaskUseCaseProvider).call(entity);
  }

  void insertSubtask(String title) {
    final taskLocalId = state.task?.localId;
    if (taskLocalId == null) {
      logger.e('[ViewTaskController] TaskLocalId is null');
      return;
    }
    final entity = SubtaskEntity.insert(title, taskLocalId);
    ref.read(createSubtaskUseCaseProvider).call(entity);
  }

  void fetchTask(int localId) {
    ref.listen(taskByLocalIdProvider(localId), (_, next) {
      next.whenData((task) {
        state = state.copyWith(task: task);
      });
    });
  }

  String? validateTaskTitle(String title) =>
      ref.read(validateTaskTitleInputUseCaseProvider).call(title);
}
