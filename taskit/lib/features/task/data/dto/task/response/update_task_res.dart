import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_res.freezed.dart';
part 'update_task_res.g.dart';

@freezed
sealed class UpdateTaskRes with _$UpdateTaskRes {
  const factory UpdateTaskRes({
    required int localId,
    required String id,
    required String userId,
    required String categoryId,
    required String title,
    required String description,
    required String priority,
    required bool deleted,
    required String status,
    DateTime? dueDate,
    DateTime? completedAt,
    required bool hasTime,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UpdateTaskRes;

  factory UpdateTaskRes.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskResFromJson(json);
}
