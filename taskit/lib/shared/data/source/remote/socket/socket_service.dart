import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/data/repo/auth_repo_impl.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/shared/application/credential_service.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/config/app/app_config.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../features/category/data/repo/category_repo.dart';

final socketServiceProvider = Provider<SocketService>((ref) {
  final authRepository = ref.watch(authRepoProvider);
  final credentialService = ref.watch(credentialServiceProvider);
  final categoryRepo = ref.watch(categoryRepoProvider);
  final taskRepo = ref.watch(taskRepoProvider);
  final sessionService = ref.watch(sessionServiceProvider);
  final service = SocketService(
    ref,
    authRepository,
    credentialService,
    sessionService,
    categoryRepo,
    taskRepo,
  );
  return service;
});

class SocketService {
  final Ref _ref;
  final CredentialService _credentialService;
  final SessionService _sessionService;
  final AuthRepo _authRepo;
  final CategoryRepo _categoryRepo;
  final TaskRepo _taskRepo;
  final Map<String, dynamic> _eventHandlers = {};
  io.Socket? _socket;

  final _connectionController = StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  SocketService(
    this._ref,
    this._authRepo,
    this._credentialService,
    this._sessionService,
    this._categoryRepo,
    this._taskRepo,
  );

  void connect() async {
    logger.i('[SocketService] Connecting to socket...');
    if (_socket?.connected ?? false) {
      logger.w('[SocketService] Socket is already connected');
      return;
    }

    logger.i('[SocketService] Initialising socket...');
    String? token = await _credentialService.getAccessToken();
    logger.i('[SocketService] Token: $token');
    _socket = io.io(
      AppConfigs.socketUrl,
      io.OptionBuilder()
          .setPath('/api/v1/socket')
          .setTransports(['websocket'])
          .setAuth({
            'token': token,
            'sessionId': await _credentialService.getSessionId(),
          })
          .enableAutoConnect()
          .build(),
    );
    _socket!.auth = {
      'token': token,
      'sessionId': await _credentialService.getSessionId(),
    };
    _eventHandlers.forEach((event, handler) {
      _socket!.on(event, handler);
      logger.d('[SocketService] Re-attached listener for: $event');
    });

    logger.i(
      '[SocketService] Socket connected: ${_socket?.auth} ${_socket?.connected} ${_socket?.id} ${_socket?.io}',
    );

    _socket!.onConnect((_) {
      logger.i('[SocketService] Socket connected');
      _connectionController.add(true);
      _syncDataAfterReconnect();
    });

    _socket!.onDisconnect((data) async {
      logger.w('[SocketService] Socket disconnected: $data');
      _connectionController.add(false);
      if (data == 'io server disconnect' || data == 'UNAUTHORIZED') {
        logger.i('[SocketService] Token expired, refreshing...');
        _refreshAndReconnect();
      }
    });

    _socket!.onConnectError((err) {
      logger.e('[SocketService] Connect Error: $err');
      if (err['message'] == 'UNAUTHORIZED') _refreshAndReconnect();
    });
  }

  void _syncDataAfterReconnect() async {
    logger.i('[SocketService] Syncing data after reconnect...');
    final userLocalId = _ref.read(authControllerProvider).user?.localId;
    if (userLocalId == null) return;
    await _categoryRepo.pushAllUnsynced(userLocalId);
    await _categoryRepo.pullCategories(userLocalId);
    await _taskRepo.pushAllUnsynced(userLocalId);
    await _taskRepo.pullTasks(userLocalId);
    _sessionService.saveLastSyncTime(DateTime.now().toUtc().toIso8601String());
    logger.i('[SocketService] Data synced after reconnect');
  }

  void on(String event, Function(dynamic) handler) {
    logger.i('[SocketService] Registering listener for event $event');
    _eventHandlers[event] = handler;
    _socket?.on(event, handler);
    logger.d('[SocketService] Re-attached listener for: $event');
  }

  void emit(String event, dynamic data) {
    logger.i('[SocketService] Emitting event $event with data $data');
    _socket?.emit(event, data);
  }

  Future<void> _refreshAndReconnect() async {
    try {
      await _authRepo.refreshToken();
      final newToken = await _credentialService.getAccessToken();
      final sessionId = await _credentialService.getSessionId();
      final newAuth = {'token': newToken, 'sessionId': sessionId};
      _socket!.io.options?['auth'] = newAuth;
      _socket!.auth = newAuth;
      _socket!.connect();
    } catch (e) {
      logger.e('[SocketService] Failed to refresh token: $e');
    }
  }

  void disconnect() {
    logger.i('[SocketService] Disconnecting socket...');
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }
}
