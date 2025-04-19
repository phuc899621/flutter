
import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_response_data.freezed.dart';
part 'base_response_data.g.dart';
@freezed
abstract class BaseData with _$BaseData{
  const factory BaseData({
    required String empty,
  }) = _BaseData;
  factory BaseData.fromJson(Map<String, dynamic> json) => _$BaseDataFromJson(json);
}