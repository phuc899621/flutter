import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data.freezed.dart';
part 'category_data.g.dart';

@freezed
abstract class CategoryData with _$CategoryData {
  const factory CategoryData(
      {@JsonKey(name: '_id') required String id,
      required String name,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String userId}) = _CategoryData;
  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
