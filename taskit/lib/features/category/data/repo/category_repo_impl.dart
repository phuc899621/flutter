import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/data/dto/req/add_category_req.dart';
import 'package:taskit/features/category/data/dto/req/deleted_categories_sync_req.dart';
import 'package:taskit/features/category/data/mapper/category_mapper.dart';
import 'package:taskit/features/category/data/source/local/category_local_source.dart';
import 'package:taskit/features/category/data/source/remote/category_api.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/log/logger_provider.dart';
import '../dto/req/categories_sync_req.dart';
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
    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
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
    final categoryLocalId = await _source.insertCategory(category);
    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
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
        await _sessionService.saveLastSyncTime(
          DateTime.now().toUtc().toIso8601String(),
        );
        return _source.updateSyncCreateCategory(
          categoryRes.data.localId,
          categoryRes.data.id,
          userLocalId,
        );
      }, errorMessage: 'Failed to insert remote category');

  @override
  Future<List<CategoryEntity>> syncCategories(
    List<CategoryEntity> categories,
  ) => callSafe(() async {
    final result = await _api.syncCategories(
      CategoriesSyncReq(
        categories: categories.map((e) => e.toSyncReqData()).toList(),
      ),
    );
    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
    logger.i('sync categories response: \n $result');
    return result.data.map((e) => e.toEntity()).toList();
  });

  @override
  Future<List<CategoryEntity>> syncDeletedCategories(
    List<CategoryEntity> categories,
  ) => callSafe(() async {
    final result = await _api.syncDeleteCategories(
      DeletedCategoriesSyncReq(
        categories: categories.map((e) => e.toDeletedSyncReqData()).toList(),
      ),
    );
    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
    logger.i('sync deleted categories response: \n $result');
    return result.data.map((e) => e.toEntity()).toList();
  });

  @override
  Future<void> deleteCategoriesByLocalIds(
    int userLocalId,
    List<int> localIds,
  ) => callSafe(() async {
    await _source.deleteCategoriesByLocalIds(userLocalId, localIds);
    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
  });

  @override
  Future<void> markCategoriesAsSynced(
    int userLocalId,
    List<CategoryEntity> categories,
  ) => callSafe(() async {
    final localIds = categories.map((e) => e.localId).toList();
    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
    return _source.markCategoriesAsSynced(userLocalId, localIds);
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
      result.data.map((e) => e.toEntity()).toList(),
    );

    await _sessionService.saveLastSyncTime(
      DateTime.now().toUtc().toIso8601String(),
    );
  });
}
