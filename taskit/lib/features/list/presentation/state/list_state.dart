
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/shared/domain/model/task_model.dart';
part 'list_state.freezed.dart';
@freezed
abstract class ListState with _$ListState {
  const factory ListState({
    String? error,
    DateTime? selectedDate,
    String? selectedStatus,
    @Default([]) List<TaskModel> tasks,
  })=_ListState;
}