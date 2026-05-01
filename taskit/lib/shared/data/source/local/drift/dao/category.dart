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
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) & tbl.deleted.equals(false),
          ))
          .watch();

  //endregion

  //================================
  //========== READ ===============
  //================================
  //region READ
  Future<List<CategoryTableData>> getCategories(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) & tbl.deleted.equals(false),
          ))
          .get();

  Future<CategoryTableData?> getDefaultCategory(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.deleted.equals(false) &
                tbl.isDefault.equals(true),
          ))
          .getSingleOrNull();

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

  Future<CategoryTableData?> getCategoryByName(String name, int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.name.lower().equals(name.toLowerCase()) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<List<CategoryTableData>> getUnsyncedCategories(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.deleted.equals(false) &
                tbl.synced.equals(false),
          ))
          .get();

  Future<List<CategoryTableData>> getUnsyncedDeletedCategories(
    int userLocalId,
  ) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.deleted.equals(true) &
                tbl.synced.equals(false),
          ))
          .get();

  //endregion

  //================================
  //========== INSERT ===============
  //================================
  //region INSERT
  Future<int> insertCategory(CategoryTableCompanion category) =>
      into(categoryTable).insert(category);

  //endregion

  //================================
  //========== UPDATE ===============
  //================================
  //region UPDATE
  Future<int> updateCategoryByLocalId(
    int localId,
    int userLocalId,
    CategoryTableCompanion category,
  ) =>
      (update(categoryTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .write(category);

  //endregion

  //================================
  //========== DELETE ===============
  //================================
  //region DELETE
  Future<int> deleteCategoryByLocalId(int localId, int userLocalId) =>
      (delete(categoryTable)..where(
            (item) =>
                item.localId.equals(localId) &
                item.userLocalId.equals(userLocalId),
          ))
          .go();

  Future<void> reconcileCategories({
    required int userLocalId,
    required List<CategoryTableCompanion> categories,
  }) async {
    final upsertCategories = categories
        .where((e) => !(e.deleted.value))
        .toList();

    final deleteCategoryIds = categories
        .where((e) => e.deleted.value)
        .map((e) => e.remoteId.value)
        .whereType<String>()
        .toList();

    await transaction(() async {
      if (upsertCategories.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            categoryTable,
            upsertCategories,
            mode: InsertMode.insertOrReplace,
          );
        });
      }

      if (deleteCategoryIds.isNotEmpty) {
        await (delete(categoryTable)..where(
              (tbl) =>
                  tbl.userLocalId.equals(userLocalId) &
                  tbl.remoteId.isIn(deleteCategoryIds),
            ))
            .go();
      }
    });
  }

  Future<void> updateCategories(
    List<int> localIds,
    CategoryTableCompanion category,
    int userLocalId,
  ) => batch((b) {
    for (final id in localIds) {
      b.update(
        categoryTable,
        category,
        where: (tbl) =>
            tbl.userLocalId.equals(userLocalId) & tbl.localId.equals(id),
      );
    }
  });

  Future<int> deleteCategoryByName(String name, int userLocalId) =>
      (delete(categoryTable)..where(
            (item) =>
                item.name.equals(name) & item.userLocalId.equals(userLocalId),
          ))
          .go();

  Future<void> deleteCategoriesByLocalIds(
    int userLocalId,
    List<int> localIds,
  ) =>
      (delete(categoryTable)..where(
            (item) =>
                item.userLocalId.equals(userLocalId) &
                item.localId.isIn(localIds),
          ))
          .go();
  //endregion
}
