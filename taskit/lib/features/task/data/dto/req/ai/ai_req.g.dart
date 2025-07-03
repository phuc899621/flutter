// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiReqGenerate _$AiReqGenerateFromJson(Map<String, dynamic> json) =>
    _AiReqGenerate(
      text: json['text'] as String,
      utcOffset: json['utcOffset'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AiReqGenerateToJson(_AiReqGenerate instance) =>
    <String, dynamic>{
      'text': instance.text,
      'utcOffset': instance.utcOffset,
      'runtimeType': instance.$type,
    };

_AiReqQuestion _$AiReqQuestionFromJson(Map<String, dynamic> json) =>
    _AiReqQuestion(
      text: json['text'] as String,
      utcOffset: json['utcOffset'] as String,
      language: json['language'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AiReqQuestionToJson(_AiReqQuestion instance) =>
    <String, dynamic>{
      'text': instance.text,
      'utcOffset': instance.utcOffset,
      'language': instance.language,
      'runtimeType': instance.$type,
    };
