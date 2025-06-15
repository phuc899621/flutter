import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggest_category.freezed.dart';
part 'suggest_category.g.dart';

@freezed
abstract class SuggestCategoryReq with _$SuggestCategoryReq {
  const factory SuggestCategoryReq({
    required String title,
  })=_SuggestCategoryReq;
  factory SuggestCategoryReq.fromJson(Map<String, dynamic> json) => _$SuggestCategoryReqFromJson(json);
}
