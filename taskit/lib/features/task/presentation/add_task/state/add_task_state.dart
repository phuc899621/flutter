import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';

part 'add_task_state.freezed.dart';

@freezed
sealed class AddTaskState with _$AddTaskState {
  const factory AddTaskState(
      {@Default(false) bool isLoading,
      @Default(false) bool isCategoriesLoading,
      bool? isCreateTaskSuccess,
      String? error,
      @Default([]) List<CategoryEntity> categories,
      @Default([]) List<CategoryEntity> aiCategories,
      @Default([]) List<SubtaskEntity> subtasks,
      @Default(TaskPriority.none) TaskPriority selectedPriority,
      CategoryEntity? selectedCategory,
      DateTime? selectedDate,
      @Default({}) Map<String, dynamic> addTaskForm,
      @Default('') String title,
      @Default('') String description,
      @Default(false) isTimeSelected}) = _AddTaskState;
}
