import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dto/req/subtask/subtask.dart';

part 'create_task_state.freezed.dart';

@freezed
abstract class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState({
    @Default(false) bool isLoading,
    @Default(false) bool isCategoriesLoading,
    bool? isCreateTaskSuccess,
    String? error,
    @Default([]) List<String> categories,
    @Default([]) List<String> AICategories,
    @Default([]) List<SubtaskReq> subtasks,
    @Default([]) List<TextEditingController> subtaskControllers,
    @Default('none') String selectedPriority,
    String? selectedCategory,
    DateTime? selectedDate,
    @Default({}) Map<String, dynamic> createTaskForm,
  }) = _CreateTaskState;
}
