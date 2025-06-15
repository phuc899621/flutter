import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../table/category.dart';

part 'category.g.dart';

final categoryDaoProvider = Provider<CategoryDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CategoryDao(db);
});

@DriftAccessor(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  /*
  * Watch
  * */
  Stream<List<CategoryTableData>> watchAllCategories() =>
      select(categoryTable).watch();

  /*
  * Read
  * */
  Future<List<CategoryTableData>> getCategories() =>
      select(categoryTable).get();
  Future<CategoryTableData?> getCategoryByLocalId(int localId) =>
      (select(categoryTable)..where((tbl) => tbl.localId.equals(localId)))
          .getSingleOrNull();

  /*
  * Insert
  * */
  Future<int> insertCategory(CategoryTableCompanion category) =>
      into(categoryTable).insert(category);

  Future<void> insertAllCategories(List<CategoryTableCompanion> categories) =>
      batch((batch) {
        batch.insertAll(categoryTable, categories);
      });

  /*
  * Update
  * */
  Future<bool> updateCategory(CategoryTableCompanion category) =>
      update(categoryTable).replace(category);

  /*
  * Delete
  * */
  Future<int> deleteCategoryById(int id) =>
      (delete(categoryTable)..where((item) => item.localId.equals(id))).go();
  Future<int> deleteCategoryByName(String name) =>
      (delete(categoryTable)..where((item) => item.name.equals(name))).go();
}
