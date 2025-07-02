import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_category_data.freezed.dart';
part 'add_category_data.g.dart';

@freezed
sealed class AddCategoryData with _$AddCategoryData {
  const factory AddCategoryData({
    required int localId,
    required String id,
  }) = _AddCategoryData;

  factory AddCategoryData.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryDataFromJson(json);
}
