import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_entity.dart';

part 'category_management_state.freezed.dart';

@freezed
sealed class CategoryManagementState with _$CategoryManagementState {
  factory CategoryManagementState({
    String? apiError,
    @Default(CategoryManagementStatus.initial) CategoryManagementStatus status,
    @Default([]) List<CategoryEntity> categories,
  }) = _CategoryManagementState;
}

enum CategoryManagementStatus { initial, loading, success, failure }
