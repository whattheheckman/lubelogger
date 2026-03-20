import 'dart:async';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/app_database.dart';
import '../network/api_client.dart';
import '../settings/settings_repository.dart';
import '../settings/app_settings.dart';
import '../../features/vehicles/data/local_vehicle_repository.dart';

part 'sync_service.g.dart';

/// SyncService orchestrates push (local → remote) and pull (remote → local).
class SyncService {
  SyncService({
    required this.db,
    required this.dio,
    required this.settings,
  });

  final AppDatabase db;
  final Dio dio;
  final AppSettings settings;

  /// Push all pending entries in the sync queue.
  Future<void> pushPending() async {
    if (settings.appMode != AppMode.connected) return;
    final pending = await db.syncQueueDao.getPending();
    for (final entry in pending) {
      await _processEntry(entry);
    }
  }

  Future<void> _processEntry(SyncQueueData entry) async {
    await db.syncQueueDao.markProcessing(entry.id);
    try {
      await _dispatchOperation(entry);
      await db.syncQueueDao.markDone(entry.id);
    } catch (e) {
      final newRetry = entry.retryCount + 1;
      if (newRetry >= 3) {
        await db.syncQueueDao.markPermanentlyFailed(entry.id);
        return;
      }
      // Exponential backoff: 30s, 2m, 8m
      final delay = Duration(seconds: 30 * (1 << newRetry));
      final nextRetry = DateTime.now().add(delay);
      await db.syncQueueDao.markFailed(entry.id, newRetry, nextRetry);
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
    try {
      final resp = await dio.get('/api/vehicles');
      if (resp.statusCode == 200) {
        // TODO: parse and upsert vehicles into local DB
      }
    } catch (_) {
      // Silently ignore pull failures; local data remains
    }
  }
}

@riverpod
SyncService syncService(SyncServiceRef ref) {
  final db = ref.watch(appDatabaseProvider);
  final dio = ref.watch(apiClientProvider);
  final settings = ref.watch(settingsRepositoryProvider).current;
  return SyncService(db: db, dio: dio, settings: settings);
}
