import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/data/source/remote/socket/socket_service.dart';
import '../../../shared/log/logger_provider.dart';
import '../data/repo/category_repo.dart';

final categorySyncServiceProvider = Provider<CategorySyncService>((ref) {
  final repo = ref.watch(categoryRepoProvider);
  final socket = ref.watch(socketServiceProvider);
  final service = CategorySyncService(repo, socket);
  return service;
});

enum CategorySocketAction {
  create('CREATE'),
  update('UPDATE'),
  delete('DELETE'),
  bulkSync('BULK_SYNC'),
  bulkDelete('BULK_DELETE'),
  unknown('UNKNOWN');

  final String value;

  const CategorySocketAction(this.value);

  static CategorySocketAction fromString(String? val) {
    return CategorySocketAction.values.firstWhere(
      (e) => e.value == val,
      orElse: () => CategorySocketAction.unknown,
    );
  }
}

class CategorySyncService {
  final CategoryRepo _categoryRepo;
  final SocketService _socketService;
  bool _isInit = false;
  bool _isSyncing = false;
  DateTime? _lastSyncTime;
  int? _currentUserLocalId;

  CategorySyncService(this._categoryRepo, this._socketService);

  static const _syncCooldown = Duration(seconds: 10);

  void init() {
    if (_isInit) return;
    logger.i('[CategorySyncService] category socket listen');
    _socketService.on('category_changed', _handleCategoryChanged);
    _isInit = true;
  }

  Future<void> syncAll(int userLocalId, {String caller = 'unknown'}) async {
    _currentUserLocalId = userLocalId;
    init();
    if (_isSyncing) {
      logger.d(
        '[CategorySyncService] Sync already in progress. Ignoring call from: $caller',
      );
      return;
    }

    final now = DateTime.now().toUtc();
    if (_lastSyncTime != null &&
        now.difference(_lastSyncTime!) < _syncCooldown) {
      logger.d(
        '[CategorySyncService] Skipping sync (Cooldown active). Caller: $caller',
      );
      return;
    }

    _isSyncing = true;
    try {
      int retryCount = 0;
      const maxRetries = 2;
      bool success = false;
      logger.i(
        '[CategorySyncService] Starting sync cycle. Triggered by: $caller',
      );
      while (retryCount < maxRetries && !success) {
        try {
          await _categoryRepo.pushAllUnsynced(userLocalId);
          await _categoryRepo.pullCategories(userLocalId);
          success = true;
        } catch (e, s) {
          logger.e(
            '[CategorySyncService] Sync failed for user $userLocalId',
            error: e,
            stackTrace: s,
          );
          retryCount++;
          if (retryCount >= maxRetries) rethrow;
          await Future.delayed(const Duration(seconds: 2));
        }
      }
    } catch (e, s) {
      logger.e(
        '[CategorySyncService] Sync failed for user $userLocalId',
        error: e,
        stackTrace: s,
      );
    } finally {
      _lastSyncTime = DateTime.now().toUtc();
      _isSyncing = false;
    }
  }

  Future<void> _handleCategoryChanged(dynamic payload) async {
    logger.i('[CategorySyncService] _handleCategoryChanged: $payload');
    if (payload is! Map<String, dynamic> || _currentUserLocalId == null) {
      logger.e(
        '[CategorySyncService] Invalid data received: $payload or _currentUserLocalId is null $_currentUserLocalId',
      );
      return;
    }
    final action = CategorySocketAction.fromString(payload['action']);
    final data = payload['data'];
    logger.t('[CategorySyncService] _handleCategoryChanged: $action');
    try {
      switch (action) {
        case CategorySocketAction.create:
          await _categoryRepo.handleRemoteInsert(data, _currentUserLocalId!);
          logger.t('[CategorySyncService] Insert completed');
          break;
        case CategorySocketAction.update:
          await _categoryRepo.handleRemoteUpdate(data, _currentUserLocalId!);
          logger.t('[CategorySyncService] Update completed');
          break;
        case CategorySocketAction.delete:
          await _categoryRepo.handleRemoteDelete(data, _currentUserLocalId!);
          logger.t('[CategorySyncService] Delete completed');
          break;
        case CategorySocketAction.bulkSync:
          await _categoryRepo.handleRemoteBulkSync(data, _currentUserLocalId!);
          logger.t('[CategorySyncService] Bulk sync completed');
          break;
        case CategorySocketAction.bulkDelete:
          await _categoryRepo.handleRemoteBulkDelete(
            data,
            _currentUserLocalId!,
          );
          logger.t('[CategorySyncService] Bulk delete completed');
          break;
        default:
          logger.e('[CategorySyncService] Unknown action: $action');
          break;
      }
    } catch (e, s) {
      logger.e(
        '[CategorySyncService] Failed to handle category change',
        error: e,
        stackTrace: s,
      );
    }
  }
}
