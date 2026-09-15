import 'dart:async';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/network/api_client.dart';
import 'package:lubelogger/core/settings/settings_repository.dart';
import 'package:lubelogger/core/settings/app_settings.dart';
import 'sync_logger.dart';
import 'package:lubelogger/features/vehicles/data/local_vehicle_repository.dart';

part 'sync_service.g.dart';

/// SyncService orchestrates push (local → remote) and pull (remote → local).
class SyncService {
  SyncService({
    required this.db,
    required this.dio,
    required this.settings,
    required this.logger,
  });

  final AppDatabase db;
  final Dio dio;
  final AppSettings settings;
  final SyncLogger logger;

  /// Push all pending entries in the sync queue.
  Future<void> pushPending() async {
    if (settings.appMode != AppMode.connected) return;
    logger.log('Connecting to server');

    final connected = await _pingServer();
    if (!connected) {
      logger.log('Connection failed — server unreachable');
      return;
    }
    logger.log('Connection successful. Detecting changes...');

    final pending = await db.syncQueueDao.getPending();
    if (pending.isEmpty) {
      logger.log('Nothing to sync');
      return;
    }
    for (final entry in pending) {
      await _processEntry(entry);
    }
    logger.log('Fully synced');
  }

  Future<bool> _pingServer() async {
    try {
      await dio.get('/api/vehicles');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _processEntry(SyncQueueData entry) async {
    final label = '[${entry.entityType}]';
    logger.log('Pushing $label (${entry.operation})');
    await db.syncQueueDao.markProcessing(entry.id);
    try {
      await _dispatchOperation(entry);
      await db.syncQueueDao.markDone(entry.id);
      logger.log('Accepted $label');
    } catch (e) {
      final newRetry = entry.retryCount + 1;
      if (newRetry >= 3) {
        await db.syncQueueDao.markPermanentlyFailed(entry.id);
        logger.log('Failed $label — giving up after 3 retries');
        return;
      }
      // Exponential backoff: 30s, 2m, 8m
      final delaySeconds = 30 * (1 << newRetry);
      final delay = Duration(seconds: delaySeconds);
      final nextRetry = DateTime.now().add(delay);
      await db.syncQueueDao.markFailed(entry.id, newRetry, nextRetry);
      logger.log('Retrying $label in ${delaySeconds}s');
    }
  }

  Future<void> _dispatchOperation(SyncQueueData entry) async {
    final type = entry.entityType;
    final op = entry.operation;
    switch (type) {
      case 'vehicle':
        if (op == 'delete') {
          await dio.post('/api/vehicle/delete', data: {'id': entry.remoteId});
        } else if (op == 'create') {
          await dio.post('/api/vehicle/add', data: entry.payload);
        } else {
          await dio.post('/api/vehicle/update', data: entry.payload);
        }
      case 'service_record':
        _postRecord('/api/vehicle/servicerecord', entry);
      case 'repair_record':
        _postRecord('/api/vehicle/repairrecord', entry);
      case 'upgrade_record':
        _postRecord('/api/vehicle/upgraderecord', entry);
      case 'gas_record':
        _postRecord('/api/vehicle/gasrecord', entry);
      case 'odometer_record':
        _postRecord('/api/vehicle/odometerrecord', entry);
      case 'tax_record':
        _postRecord('/api/vehicle/taxrecord', entry);
      case 'reminder':
        _postRecord('/api/vehicle/reminder', entry);
      case 'plan_record':
        _postRecord('/api/vehicle/planrecord', entry);
      case 'supply':
        _postRecord('/api/vehicle/supply', entry);
      case 'note':
        _postRecord('/api/vehicle/note', entry);
    }
  }

  Future<void> _postRecord(String basePath, SyncQueueData entry) async {
    switch (entry.operation) {
      case 'create':
        await dio.post('$basePath/add', data: entry.payload);
      case 'update':
        await dio.post('$basePath/update', data: entry.payload);
      case 'delete':
        await dio.post('$basePath/delete', data: {'id': entry.remoteId});
    }
  }

  /// Pull all vehicle records for a given vehicleId from the remote.
  Future<void> pullVehicle(int vehicleId) async {
    if (settings.appMode != AppMode.connected) return;
    logger.log('Checking for server changes...');
    try {
      final resp = await dio.get('/api/vehicles');
      if (resp.statusCode == 200) {
        // TODO: parse and upsert vehicles into local DB
      }
    } catch (_) {
      logger.log('Sync failed — could not reach server');
    }
  }
}

@riverpod
SyncService syncService(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  final dio = ref.watch(apiClientProvider);
  final settings = ref.watch(settingsRepositoryProvider).current;
  final logger = ref.watch(syncLoggerProvider);
  return SyncService(db: db, dio: dio, settings: settings, logger: logger);
}
