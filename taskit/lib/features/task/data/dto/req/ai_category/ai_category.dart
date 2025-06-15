import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_category.freezed.dart';
part 'ai_category.g.dart';

@freezed
abstract class AiCategoryReq with _$AiCategoryReq {
  const factory AiCategoryReq({
    required String title,
    required List<String> excludedCategories,
  }) = _AiCategoryReq;

  factory AiCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$AiCategoryReqFromJson(json);
}
