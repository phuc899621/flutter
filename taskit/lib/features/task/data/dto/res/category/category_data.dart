import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data.freezed.dart';
part 'category_data.g.dart';


@freezed
abstract class CategoryData with _$CategoryData {
  const factory CategoryData({
    required List<String> categories,
  }) = _CategoryData;
  factory CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);
}