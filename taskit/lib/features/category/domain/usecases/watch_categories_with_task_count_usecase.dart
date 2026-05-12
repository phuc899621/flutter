import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/data/repo/category_repo_impl.dart';

import '../../../../shared/domain/usecase/stream_usecase.dart';
import '../../data/repo/category_repo.dart';
import '../entities/category_entity.dart';

final watchCategoriesWithTaskCountUseCaseProvider = Provider((ref) {
  final categoryRepo = ref.watch(categoryRepoProvider);
  return WatchCategoriesWithTaskCount(categoryRepo);
});

class WatchCategoriesWithTaskCount
    extends StreamUseCase<List<CategoryEntity>, int> {
  final CategoryRepo _categoryRepo;

  WatchCategoriesWithTaskCount(this._categoryRepo);

  @override
  Stream<List<CategoryEntity>> call(int userLocalId) {
    return _categoryRepo.watchWithTaskCount(userLocalId).map((data) {
      final defaultCategories = data.where((category) => category.isDefault);
      final nonDefaultCategories = data.where(
        (category) => !category.isDefault,
      );
      return [...defaultCategories, ...nonDefaultCategories];
    });
  }
}
