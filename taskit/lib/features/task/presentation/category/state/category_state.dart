import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';

part 'category_state.freezed.dart';

@freezed
sealed class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default([]) List<CategoryEntity> categories,
  }) = _CategoryState;
}
