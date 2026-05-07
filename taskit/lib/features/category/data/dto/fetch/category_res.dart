import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_res.freezed.dart';
part 'category_res.g.dart';

@freezed
sealed class CategoryRes with _$CategoryRes {
  const factory CategoryRes({
    required String id,
    required String name,
    @JsonKey(name: 'default') required bool isDefault,
    required bool deleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String userId,
  }) = _CategoryRes;

  factory CategoryRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryResFromJson(json);
}
