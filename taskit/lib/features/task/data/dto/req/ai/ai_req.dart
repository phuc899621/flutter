import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_req.freezed.dart';
part 'ai_req.g.dart';

@freezed
sealed class AiReq with _$AiReq {
  const factory AiReq.generate(
      {required String text, required String utcOffset}) = _AiReqGenerate;

  const factory AiReq.question(
      {required String text,
      required String utcOffset,
      required String language}) = _AiReqQuestion;

  factory AiReq.fromJson(Map<String, dynamic> json) => _$AiReqFromJson(json);
}
