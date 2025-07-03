import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_question_data.freezed.dart';
part 'ai_question_data.g.dart';

@freezed
sealed class AiQuestionData with _$AiQuestionData {
  const factory AiQuestionData({
    required String answer,
  }) = _AiQuestionData;

  factory AiQuestionData.fromJson(Map<String, dynamic> json) =>
      _$AiQuestionDataFromJson(json);
}
