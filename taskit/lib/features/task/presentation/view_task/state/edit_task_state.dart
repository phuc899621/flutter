import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../../../domain/entities/task_entity.dart';

part 'edit_task_state.freezed.dart';

@freezed
sealed class ViewTaskState with _$ViewTaskState {
  factory ViewTaskState({
    TaskEntity? task,
    @Default([]) List<CategoryEntity> categories,
  }) = _EditTaskState;
}
