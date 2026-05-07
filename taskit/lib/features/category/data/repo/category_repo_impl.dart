import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/data/dto/add/add_category_req.dart';
import 'package:taskit/features/category/data/dto/fetch/category_res.dart';
import 'package:taskit/features/category/data/dto/sync/delete/deleted_categories_sync_req.dart';
import 'package:taskit/features/category/data/mapper/category_local_mapper.dart';
import 'package:taskit/features/category/data/source/local/category_local_source.dart';
import 'package:taskit/features/category/data/source/remote/category_api.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/data/source/local/drift/database/database.dart';
import '../../../../shared/log/logger_provider.dart';
import '../dto/sync/insert_update/categories_sync_req.dart';
import '../mapper/category_remote_mapper.dart';
import '../source/local/category_local_source_impl.dart';
import 'category_repo.dart';

final categoryRepoProvider = Provider((ref) {
  final localSource = ref.watch(categoryLocalSourceProvider);
  final api = ref.watch(categoryApiProvider);
  final sessionService = ref.watch(sessionServiceProvider);
  return CategoryRepoImpl(localSource, api, sessionService);
});

class CategoryRepoImpl with DioExceptionMapper implements CategoryRepo {
  final CategoryLocalSource _source;
  final CategoryApi _api;
  final SessionService _sessionService;

  CategoryRepoImpl(this._source, this._api, this._sessionService);

  @override
  Stream<List<CategoryEntity>> watchAllCategories(int userLocalId) =>
      _source.watchAllCategories(userLocalId);

  @override
  Future<void> deleteCategory(int localId, int userLocalId) => callSafe(
    () async {
      final category = await _source.getCategoryByLocalId(localId, userLocalId);
      if (category == null || category.isDefault) return;
      logger.i('delete category with localId $localId');
      final remoteId = category.remoteId;
      if (remoteId == null) return;
      await _sessionService.saveLastSyncTime(
        DateTime.now().toUtc().toIso8601String(),
      );
      if (remoteId.isEmpty) {
        await _source.deleteCategoryByLocalId(localId, userLocalId);
      } else {
        await _source.updateDeleteCategory(localId, userLocalId);
        deleteRemoteCategory(localId, remoteId, userLocalId);
      }
    },
  );

  @override
  Future<void> deleteRemoteCategory(
    int localId,
    String categoryRemoteId,
    int userLocalId,
  ) => callSafe(() async {
    await _api.delete(categoryRemoteId);
    await _source.deleteCategoryByLocalId(localId, userLocalId);
    _updateSyncTime();
  }, errorMessage: 'Failed to delete remote task');

  @override
  Future<CategoryEntity?> getCategoryByName(String name, int userLocalId) =>
      _source.getCategoryByName(name, userLocalId);

  @override
  Future<List<CategoryEntity>> getUnsyncedCategories(int userLocalId) =>
      _source.getUnsyncedCategories(userLocalId);

  @override
  Future<List<CategoryEntity>> getUnsyncedDeletedCategories(int userLocalId) =>
      _source.getUnsyncedDeletedCategories(userLocalId);

  @override
  Future<int> insertCategory(CategoryEntity category) => callSafe(() async {
    final categorySameName = await _source.getCategoryByName(
      category.name,
      category.userLocalId,
    );
    if (categorySameName != null) {
      throw Exception('Category with same name already exists');
    }
    final categoryLocalId = await _source.insertCategory(category);
    _updateSyncTime();
    if (categoryLocalId == -1) return -1;
    logger.i('insert category with localId $categoryLocalId');
    unawaited(insertRemoteCategory(categoryLocalId, category.userLocalId));
    return categoryLocalId;
  });

  @override
  Future<void> insertRemoteCategory(int categoryLocalId, int userLocalId) =>
      callSafe(() async {
        final category = await _source.getCategoryByLocalId(
          categoryLocalId,
          userLocalId,
        );
        if (category == null) return;
        final request = AddCategoryReq(
          localId: category.localId,
          name: category.name,
        );
        logger.i('add category request: \n $request');

        final categoryRes = await _api.create(request);
        logger.i('add category response: \n $categoryRes');
        _updateSyncTime();
        return _source.updateCategoryById(
          categoryRes.data.localId,
          userLocalId,
          category.toSyncCompanion(categoryRes.data.id, _now),
        );
      }, errorMessage: 'Failed to insert remote category');

  @override
  Future<void> pushAllUnsynced(int userLocalId) => callSafe(() async {
    final unsynced = await _source.getUnsyncedCategories(userLocalId);
    final unsyncedDeleted = await _source.getUnsyncedDeletedCategories(
      userLocalId,
    );
    logger.i('unsynced: $unsynced, unsyncedDeleted: $unsyncedDeleted');
    if (unsyncedDeleted.isNotEmpty) {
      final result = await _api.syncDeleteCategories(
        DeletedCategoriesSyncReq(
          categories: unsyncedDeleted
              .map((e) => e.toDeletedSyncReqData())
              .toList(),
        ),
      );
      final deletedIds = result.data.map((e) => e.localId).toList();
      await _source.deleteCategoriesByLocalIds(userLocalId, deletedIds);
      _updateSyncTime();
    }
    if (unsynced.isNotEmpty) {
      final result = await _api.syncCategories(
        CategoriesSyncReq(
          categories: unsynced.map((e) => e.toSyncReqEntry()).toList(),
        ),
      );
      logger.i('sync categories response: \n $result');
      final accept = result.data.accept;
      final reject = result.data.reject;
      await _source.updateSyncCategories(
        accept.map((e) => e.toCompanion()).toList(),
        userLocalId,
      );
      final deleteReject = reject.where((e) => e.id == null).toList();
      final updateFromServer = reject
          .where((e) => e.id != null && e.serverData != null)
          .toList();
      final updateCompanion = updateFromServer
          .map((e) => e.toCompanion())
          .whereType<CategoryTableCompanion>()
          .toList();
      await _source.deleteCategoriesByLocalIds(
        userLocalId,
        deleteReject.map((e) => e.localId).toList(),
      );
      await _source.updateSyncCategories(
        updateCompanion.map((e) => e).toList(),
        userLocalId,
      );
      _updateSyncTime();
    }
  });

  @override
  Future<void> pullCategories(int userLocalId) => callSafe(() async {
    logger.i('pull categories call');
    final lastSyncTime = _sessionService.getLastSyncTime();
    logger.i('lastSyncTime: $lastSyncTime');
    final result = await _api.pullCategories(lastSyncTime);
    logger.i('reulst pull: $result');
    await _source.reconcileCategories(
      userLocalId,
      result.data.map((e) => e.toEntity(userLocalId)).toList(),
    );

    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
  });

  //region REMOTE
  @override
  Future<void> handleRemoteInsert(Map<String, dynamic> data, int userLocalId) =>
      callSafe(() async {
        final category = CategoryRes.fromJson(data);
        final categorySameName = await _source.getCategoryByName(
          category.name,
          userLocalId,
        );
        if (categorySameName != null) {
          throw Exception('Category with same name already exists');
        }
        final categoryEntity = category.toEntity(userLocalId);
        await _source.insertCategory(categoryEntity);
        _updateSyncTime();
      });

  //endregion
  @override
  Future<void> handleRemoteUpdate(Map<String, dynamic> data, int userLocalId) =>
      callSafe(() async {
        final category = CategoryRes.fromJson(data);
        await _source.updateCategoryByRemoteId(
          category.id,
          userLocalId,
          category.toRemoteCompanion(userLocalId),
        );
        logger.d('remote update category: $category');
        _updateSyncTime();
      });

  @override
  Future<void> handleRemoteDelete(String? remoteId, int userLocalId) =>
      callSafe(() async {
        if (remoteId == null) {
          throw Exception('Category has no remote id');
        }
        await _source.deleteCategoryByRemoteId(remoteId, userLocalId);
        logger.d('remote delete category: $remoteId');
        _updateSyncTime();
      });

  @override
  Future<void> handleRemoteBulkSync(
    Map<String, dynamic> data,
    int userLocalId,
  ) => callSafe(() async {
    final categories = data['categories'] as List;
    final categoryEntities = categories
        .map((e) => CategoryRes.fromJson(e))
        .toList();
    await _source.upsertCategories(
      categoryEntities.map((e) => e.toRemoteCompanion(userLocalId)).toList(),
    );
    logger.d(
      'remote bulk sync categories: ${categoryEntities.map((e) => e.id).toList()}',
    );
    _updateSyncTime();
  });

  @override
  Future<void> handleRemoteBulkDelete(List<dynamic> data, int userLocalId) =>
      callSafe(() async {
        final categoryIds = data.map((e) => e as String).toList();
        await _source.deleteCategoriesByRemoteIds(userLocalId, categoryIds);
        logger.d('remote bulk delete categories: $categoryIds');
        _updateSyncTime();
      });

  Future<void> _updateSyncTime() async => await _sessionService
      .saveLastSyncTime(DateTime.now().toUtc().toIso8601String());

  DateTime get _now => DateTime.now();
}
