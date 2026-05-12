import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../../../../shared/domain/usecase/usecase.dart';

final validateCategoryInputUseCaseProvider =
    Provider<ValidateCategoryInputUseCase>(
      (ref) => ValidateCategoryInputUseCase(),
    );

class ValidateCategoryInputParams {
  final String name;
  final List<CategoryEntity> categories;

  ValidateCategoryInputParams(this.name, this.categories);
}

class ValidateCategoryInputUseCase
    extends UseCase<String?, ValidateCategoryInputParams> {
  @override
  String? call(ValidateCategoryInputParams params) {
    if (params.name.isEmpty) {
      return 'Please enter a category name';
    }
    if (params.categories.any((element) => element.name == params.name)) {
      return 'Category name already exists';
    }
    if (params.name.length <= 3) {
      return 'Category name must be at least 3 characters long';
    }
    if (!RegExp(r'^[a-zA-Z0-9À-ỹ\s]+$').hasMatch(params.name)) {
      return 'Category must not contain special characters';
    }
    return null;
  }
}
