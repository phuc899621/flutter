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

  //================================
  //========== WATCH ===============
  //================================
  //region WATCH
  Stream<List<CategoryTableData>> watchAllCategories(int userLocalId) =>
      (select(
        categoryTable,
      )..where((tbl) => tbl.userLocalId.equals(userLocalId))).watch();

  //endregion

  //================================
  //========== READ ===============
  //================================
  //region READ
  Future<List<CategoryTableData>> getCategories(int userLocalId) => (select(
    categoryTable,
  )..where((tbl) => tbl.userLocalId.equals(userLocalId))).get();

  Future<CategoryTableData?> getCategoryByLocalId(
    int localId,
    int userLocalId,
  ) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<CategoryTableData?> getCategoryByRemoteId(
    String remoteId,
    int userLocalId,
  ) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.remoteId.equals(remoteId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<CategoryTableData?> findByName(String name, int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.name.lower().equals(name.toLowerCase()) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  //endregion

  //================================
  //========== INSERT ===============
  //================================
  //region INSERT
  Future<int> insertCategory(CategoryTableCompanion category) =>
      into(categoryTable).insert(category);

  Future<int> insertCategoryWithoutSync(CategoryTableCompanion category) =>
      into(categoryTable).insert(category.copyWith(isSynced: Value(false)));

  Future<void> insertAllCategories(List<CategoryTableCompanion> categories) =>
      batch((batch) {
        batch.insertAll(categoryTable, categories);
      });

  //endregion

  //================================
  //========== UPDATE ===============
  //================================
  //region UPDATE
  Future<bool> updateCategory(CategoryTableCompanion category) =>
      update(categoryTable).replace(category);

  Future<bool> updateCategoryWithoutSync(CategoryTableCompanion category) =>
      update(categoryTable).replace(category);

  Future<void> updateSyncCategory(int localId, int userLocalId) =>
      (update(categoryTable)..where(
            (item) =>
                item.localId.equals(localId) &
                item.userLocalId.equals(userLocalId),
          ))
          .write(CategoryTableCompanion(isSynced: Value(true)));

  Future<void> updateSyncAddCategory(
    int localId,
    String remoteId,
    int userLocalId,
  ) =>
      (update(categoryTable)..where(
            (item) =>
                item.localId.equals(localId) &
                item.userLocalId.equals(userLocalId),
          ))
          .write(
            CategoryTableCompanion(
              isSynced: Value(true),
              remoteId: Value(remoteId),
            ),
          );

  //endregion

  //================================
  //========== DELETE ===============
  //================================
  //region DELETE
  Future<int> deleteCategoryById(int id, int userLocalId) =>
      (delete(categoryTable)..where(
            (item) =>
                item.localId.equals(id) & item.userLocalId.equals(userLocalId),
          ))
          .go();

  Future<int> deleteCategoryByName(String name, int userLocalId) =>
      (delete(categoryTable)..where(
            (item) =>
                item.name.equals(name) & item.userLocalId.equals(userLocalId),
          ))
          .go();
  //endregion
}
