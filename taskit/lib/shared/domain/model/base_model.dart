import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.freezed.dart';

@freezed
abstract class BaseModel with _$BaseModel{
  const factory BaseModel() = _BaseModel;
}