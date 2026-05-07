import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category_res.freezed.dart';
part 'add_category_res.g.dart';

@freezed
sealed class AddCategoryRes with _$AddCategoryRes {
  const factory AddCategoryRes({required int localId, required String id}) =
      _AddCategoryRes;

  factory AddCategoryRes.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryResFromJson(json);
}
