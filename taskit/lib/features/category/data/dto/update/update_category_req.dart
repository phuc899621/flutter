import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_req.freezed.dart';
part 'update_category_req.g.dart';

@freezed
sealed class UpdateCategoryReq with _$UpdateCategoryReq {
  const factory UpdateCategoryReq({required String name}) = _UpdateCategoryReq;

  factory UpdateCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryReqFromJson(json);
}
