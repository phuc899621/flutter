import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../task/domain/entities/category_entity.dart';
import '../../../../task/domain/entities/task_entity.dart';

part 'list_state.freezed.dart';

@freezed
sealed class ListState with _$ListState {
  factory ListState({
    required List<TaskEntity> filteringTask,
  }) = _ListState;
}
