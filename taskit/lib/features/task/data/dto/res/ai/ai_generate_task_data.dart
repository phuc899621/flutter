import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_generate_task_data.freezed.dart';
part 'ai_generate_task_data.g.dart';

@freezed
sealed class AiGenerateTaskData with _$AiGenerateTaskData {
  const factory AiGenerateTaskData(
      {required String title,
      required String description,
      DateTime? userUtcDueDate,
      required bool hasTime,
      required String categoryId,
      required String priority,
      required String status}) = _AiGenerateTaskData;

  factory AiGenerateTaskData.fromJson(Map<String, dynamic> json) =>
      _$AiGenerateTaskDataFromJson(json);
}
