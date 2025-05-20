import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data.freezed.dart';
part 'category_data.g.dart';

@freezed
abstract class CategoryData with _$CategoryData {
  const factory CategoryData(
      {required String id,
      required String name,
      required String userId}) = _CategoryData;
  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
