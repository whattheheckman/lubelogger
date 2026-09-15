import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/features/vehicles/data/local_vehicle_repository.dart';
import 'package:lubelogger/features/notes/domain/note_record.dart';
import 'note_record_repository.dart';

part 'local_note_record_repository.g.dart';

class LocalNoteRecordRepository implements NoteRecordRepository {
  LocalNoteRecordRepository(this._db);
  final AppDatabase _db;

  NoteRecord _fromRow(Note row) => NoteRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        title: row.title,
        body: row.body,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<NoteRecord>> watchByVehicle(int vehicleId) =>
      _db.notesDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<NoteRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.notesDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<NoteRecord?> getById(int id) async {
    final row = await _db.notesDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(NoteRecord r) async {
    final id = await _db.notesDao.insertNote(
      NotesCompanion.insert(
        vehicleId: r.vehicleId,
        title: r.title,
        body: Value(r.body),
        syncStatus: const Value('pending_create'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'note',
      localId: id,
      operation: 'create',
      payload: jsonEncode({
        'vehicleId': r.vehicleId,
        'title': r.title,
        'body': r.body,
      }),
    ));
    return id;
  }

  @override
  Future<void> update(NoteRecord r) async {
    await _db.notesDao.updateNote(
      NotesCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        title: Value(r.title),
        body: Value(r.body),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'note',
      localId: r.id,
      remoteId: Value(r.remoteId),
      operation: 'update',
      payload: jsonEncode({
        'id': r.remoteId,
        'vehicleId': r.vehicleId,
        'title': r.title,
        'body': r.body,
      }),
    ));
  }

  @override
  Future<void> delete(int id) async {
    final row = await _db.notesDao.getById(id);
    if (row != null && row.remoteId != null) {
      await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
        entityType: 'note',
        localId: id,
        remoteId: Value(row.remoteId),
        operation: 'delete',
        payload: '{}',
      ));
    }
    await _db.notesDao.deleteNote(id);
  }
}

@riverpod
LocalNoteRecordRepository localNoteRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalNoteRecordRepository(db);
}
