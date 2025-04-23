



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/create_task/data/request/create_task/create_task.dart';
import 'package:taskit/shared/application/itask_service.dart';
import 'package:taskit/shared/application/token_service.dart';
import 'package:taskit/shared/data/repository/itask_repository.dart';

import '../../../../shared/application/task_service.dart';
import '../../data/request/create_task/subtask.dart';
import '../state/create_task_state.dart';

class CreateTaskController extends Notifier<CreateTaskState>{

  @override
  CreateTaskState build() {
    return CreateTaskState();
  }
  void setSelectedPriority(String priority) {
    state = state.copyWith(selectedPriority: priority);
  }
  void setSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }
  void setSelectedDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }
  void setSelectedSubtask(List<String> subtasks) {
    state = state.copyWith(
      subtasks: subtasks.map((e) => SubtaskReq(title: e)).toList(),
    );
  }

  Future<void> createTask() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
      );
      final form = CreateTaskReq(
        title: state.createTaskForm['title'],
        description: state.createTaskForm['description'],
        category: state.selectedCategory,
        priority: state.selectedPriority,
        dueDate: state.selectedDate ?? DateTime.now(),
        subtasks: state.subtasks,

      );
      final token= await ref.read(tokenServiceProvider).getToken();
      final result = await ref.read(taskServiceProvider).createTask(token!,form);
      result.when(
          (success){
            state = state.copyWith(
              isLoading: false,
              isCreateTaskSuccess: true,
            );
          }, (failure){
            state = state.copyWith(
              isLoading: false,
              error: failure.message,
            );

      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

}