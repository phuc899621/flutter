import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/shared/domain/model/task_model.dart';

part 'category_model.freezed.dart';


@freezed
abstract class CategoryModel with _$CategoryModel{
  const factory CategoryModel({
    required List<String> categories,
  })=_CategoryModel;

}