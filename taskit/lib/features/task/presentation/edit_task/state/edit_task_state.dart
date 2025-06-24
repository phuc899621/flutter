import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';

import '../../../domain/entities/task_entity.dart';

part 'edit_task_state.freezed.dart';

@freezed
sealed class EditTaskState with _$EditTaskState {
  factory EditTaskState({
    TaskEntity? task,
    @Default([]) List<CategoryEntity> categories,
  }) = _EditTaskState;
}
