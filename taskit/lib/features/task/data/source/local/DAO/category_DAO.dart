import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/model/category.dart';

import '../task_database.dart';

final categoryDAOProvider = Provider<CategoryDAO>((ref) {
  final database = ref.watch(taskDatabaseProvider);
  return database.categoryDAO;
});

@dao
abstract class CategoryDAO {
  @Insert()
  Future<void> insert(CategoryModel category);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<CategoryModel> categories);
  @Query('SELECT * FROM categories')
  Future<List<CategoryModel>> getAllCategories();
}
