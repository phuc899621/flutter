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

  //region WATCH
  Stream<List<CategoryTableData>> watchAll(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) & tbl.deleted.equals(false),
          ))
          .watch();

  //endregion
  //region READ
  Future<List<CategoryTableData>> findAll(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) & tbl.deleted.equals(false),
          ))
          .get();

  Future<CategoryTableData?> findDefault(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.deleted.equals(false) &
                tbl.isDefault.equals(true),
          ))
          .getSingleOrNull();

  Future<CategoryTableData?> findById(int localId, int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<CategoryTableData?> findByRemoteId(String remoteId, int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.remoteId.equals(remoteId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<CategoryTableData?> findOneByName(String name, int userLocalId) =>
      (select(categoryTable)
            ..where(
              (tbl) =>
                  tbl.name.lower().equals(name.toLowerCase()) &
                  tbl.userLocalId.equals(userLocalId),
            )
            ..limit(1))
          .getSingleOrNull();

  Future<List<CategoryTableData>> findUnsynced(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.synced.equals(false) &
                tbl.deleted.equals(false),
          ))
          .get();

  Future<List<CategoryTableData>> findUnsyncedDeleted(int userLocalId) =>
      (select(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.synced.equals(false) &
                tbl.deleted.equals(true),
          ))
          .get();

  //endregion
  //region UPDATE
  Future<bool> updateById(
    int localId,
    int userLocalId,
    CategoryTableCompanion companion,
  ) =>
      (update(categoryTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .write(companion)
          .then((v) => v > 0);

  Future<bool> updateByRemoteId(
    String remoteId,
    int userLocalId,
    CategoryTableCompanion companion,
  ) =>
      (update(categoryTable)..where(
            (tbl) =>
                tbl.remoteId.equals(remoteId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .write(companion)
          .then((v) => v > 0);

  //endregion
  //region INSERT
  Future<int> insertOne(CategoryTableCompanion companion) =>
      into(categoryTable).insert(companion);

  //endregion
  //region DELETE
  Future<void> deleteById(int localId, int userLocalId) =>
      (delete(categoryTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .go();

  Future<void> deleteByRemoteId(String remoteId, int userLocalId) =>
      (delete(categoryTable)..where(
            (tbl) =>
                tbl.remoteId.equals(remoteId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .go();

  //endregion
  //region BATCH
  Future<void> upsertAll(List<CategoryTableCompanion> companions) async {
    await batch((b) {
      for (final companion in companions) {
        b.insert(
          categoryTable,
          companion,
          onConflict: DoUpdate(
            (_) => companion,
            target: [categoryTable.remoteId],
          ),
        );
      }
    });
  }

  Future<void> updateMultipleSame(
    int userLocalId,
    List<int> localIds,
    CategoryTableCompanion companion,
  ) =>
      (update(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.localId.isIn(localIds),
          ))
          .write(companion);

  Future<void> updateMultipleDifferent(
    int userLocalId,
    List<CategoryTableCompanion> companions,
  ) => batch((b) {
    for (final companion in companions) {
      b.update(
        categoryTable,
        companion,
        where: (tbl) =>
            tbl.userLocalId.equals(userLocalId) &
            tbl.localId.equals(companion.localId.value),
      );
    }
  });

  Future<void> deleteMultipleByLocalIds(int userLocalId, List<int> localIds) =>
      (delete(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.localId.isIn(localIds),
          ))
          .go();

  Future<void> deleteMultipleByRemoteIds(
    int userLocalId,
    List<String> remoteIds,
  ) =>
      (delete(categoryTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.remoteId.isIn(remoteIds),
          ))
          .go();

  Future<void> reconcile({
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
          for (final companion in upsertCategories) {
            batch.insert(
              categoryTable,
              companion,
              onConflict: DoUpdate(
                (_) => companion,
                target: [categoryTable.remoteId],
              ),
            );
          }
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

  //endregion
}
