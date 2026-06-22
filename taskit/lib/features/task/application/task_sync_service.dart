import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';

import '../../../shared/data/source/remote/socket/socket_service.dart';
import '../../../shared/log/logger_provider.dart';

final taskSyncServiceProvider = Provider<TaskSyncService>((ref) {
  final repo = ref.watch(taskRepoProvider);
  final socket = ref.watch(socketServiceProvider);
  final service = TaskSyncService(repo, socket);
  return service;
});

enum TaskSocketAction {
  create('CREATE'),
  update('UPDATE'),
  delete('DELETE'),
  bulkSync('BULK_SYNC'),
  bulkDelete('BULK_DELETE'),
  unknown('UNKNOWN');

  final String value;

  const TaskSocketAction(this.value);

  static TaskSocketAction fromString(String? val) {
    return TaskSocketAction.values.firstWhere(
      (e) => e.value == val,
      orElse: () => TaskSocketAction.unknown,
    );
  }
}

class TaskSyncService {
  final TaskRepo _taskRepo;
  final SocketService _socketService;
  bool _isInit = false;
  bool _isSyncing = false;
  DateTime? _lastSyncTime;
  int? _currentUserLocalId;

  TaskSyncService(this._taskRepo, this._socketService);

  static const _syncCooldown = Duration(seconds: 10);

  void init() {
    if (_isInit) return;
    logger.i('task socket listen');
    _socketService.on('task_changed', _handleTaskChanged);
    _isInit = true;
  }

  Future<void> syncAll(int userLocalId, {String caller = 'unknown'}) async {
    _currentUserLocalId = userLocalId;
    init();
    if (_isSyncing) {
      logger.d(
        '[TaskSyncService] Sync already in progress. Ignoring call from: $caller',
      );
      return;
    }

    final now = DateTime.now().toUtc();
    if (_lastSyncTime != null &&
        now.difference(_lastSyncTime!) < _syncCooldown) {
      logger.d(
        '[TaskSyncService] Skipping sync (Cooldown active). Caller: $caller',
      );
      return;
    }

    _isSyncing = true;
    try {
      logger.i('[TaskSyncService] Starting sync cycle. Triggered by: $caller');
      logger.t('[TaskSyncService] Step 1: Pushing unsynced local data...');
      await _taskRepo.pushAllUnsynced(userLocalId);

      logger.t('[TaskSyncService] Step 2: Pulling remote data...');
      await _taskRepo.pullTasks(userLocalId);

      _lastSyncTime = DateTime.now().toUtc();
      logger.i('[TaskSyncService] Sync cycle completed successfully.');
    } catch (e, s) {
      logger.e(
        '[TaskSyncService] Sync failed for user $userLocalId',
        error: e,
        stackTrace: s,
      );
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _handleTaskChanged(dynamic payload) async {
    logger.i('[TaskSyncService] _handleCategoryChanged: $payload');
    if (payload is! Map<String, dynamic> || _currentUserLocalId == null) {
      logger.e(
        '[TaskSyncService] Invalid data received: $payload or _currentUserLocalId is null $_currentUserLocalId',
      );
      return;
    }
    final action = TaskSocketAction.fromString(payload['action']);
    final data = payload['data'];
    logger.t('[TaskSyncService] _handleCategoryChanged: $action and $data');
    try {
      switch (action) {
        case TaskSocketAction.create:
          await _taskRepo.handleRemoteInsert(data, _currentUserLocalId!);
          logger.t('[TaskSyncService] Insert completed');
          break;
        case TaskSocketAction.update:
          await _taskRepo.handleRemoteUpdate(data, _currentUserLocalId!);
          logger.t('[TaskSyncService] Update completed');
          break;
        case TaskSocketAction.delete:
          await _taskRepo.handleRemoteDelete(data, _currentUserLocalId!);
          logger.t('[TaskSyncService] Delete completed');
          break;
        case TaskSocketAction.bulkSync:
          await _taskRepo.handleRemoteBulkSync(data, _currentUserLocalId!);
          logger.t('[TaskSyncService] Bulk sync completed');
          break;
        case TaskSocketAction.bulkDelete:
          await _taskRepo.handleRemoteBulkDelete(data, _currentUserLocalId!);
          logger.t('[TaskSyncService] Bulk delete completed');
          break;
        default:
          logger.e('[TaskSyncService] Unknown action: $action');
          break;
      }
    } catch (e, s) {
      logger.e(
        '[TaskSyncService] Failed to handle category change',
        error: e,
        stackTrace: s,
      );
    }
  }
}
