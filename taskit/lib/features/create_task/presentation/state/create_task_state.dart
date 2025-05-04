import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/create_task/data/request/create_task/subtask.dart';

import '../../../../shared/domain/model/task_model.dart';

part 'create_task_state.freezed.dart';

@freezed
abstract class CreateTaskState with _$CreateTaskState {
   const factory CreateTaskState({
    @Default(false) bool isLoading,
    bool? isCreateTaskSuccess,
    String? error,
    @Default([]) List<String> categories,
    @Default([]) List<SubtaskReq> subtasks,
    @Default([]) List<TextEditingController> subtaskControllers,
    @Default('none') String selectedPriority,
    String? selectedCategory,
    DateTime? selectedDate,
    @Default({}) Map<String, dynamic> createTaskForm,
  })=_CreateTaskState;
}