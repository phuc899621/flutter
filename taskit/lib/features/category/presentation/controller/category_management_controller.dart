import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/features/category/domain/usecases/create_category_usecase.dart';
import 'package:taskit/features/category/domain/usecases/edit_category_usecase.dart';
import 'package:taskit/features/category/presentation/state/category_management_state.dart';
import 'package:taskit/features/category/presentation/ui/providers/categories_provider.dart';

import '../../domain/usecases/delete_category_usecase.dart';
import '../../domain/usecases/validate_category_input_usecase.dart';

final categoryManagementControllerProvider =
    NotifierProvider<CategoryManagementController, CategoryManagementState>(
      () => CategoryManagementController(),
    );

class CategoryManagementController extends Notifier<CategoryManagementState> {
  @override
  CategoryManagementState build() {
    ref.listen(categoriesWithTaskCountProvider, (_, next) {
      next.whenData((categories) {
        state = state.copyWith(categories: categories);
      });
    });
    return CategoryManagementState();
  }

  void addCategory(String name) => ref
      .read(createCategoryUseCaseProvider)
      .call(CategoryEntity.insert(name: name, userLocalId: -1));

  void editCategory(int localId, String newName) {
    final newCategory = state.categories
        .firstWhere((e) => e.localId == localId)
        .copyWith(name: newName);
    ref.read(editCategoryUseCaseProvider).call(newCategory);
  }

  void deleteCategory(CategoryEntity category) =>
      ref.read(deleteCategoryUseCaseProvider).call(category);

  String? validateCategoryInput(String value) => ref
      .read(validateCategoryInputUseCaseProvider)
      .call(ValidateCategoryInputParams(value, state.categories));
}
