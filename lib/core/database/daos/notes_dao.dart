import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/notes_table.dart';

part 'notes_dao.g.dart';

@DriftAccessor(tables: [Notes])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(super.db);

  Stream<List<Note>> watchByVehicle(int vehicleId) =>
      (select(notes)..where((t) => t.vehicleId.equals(vehicleId))).watch();

  Future<List<Note>> getByVehicle(int vehicleId) =>
      (select(notes)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<Note?> getById(int id) =>
      (select(notes)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertNote(NotesCompanion n) =>
      into(notes).insert(n);

  Future<bool> updateNote(NotesCompanion n) =>
      update(notes).replace(n);

  Future<int> deleteNote(int id) =>
      (delete(notes)..where((t) => t.id.equals(id))).go();

  Future<List<Note>> getPending() =>
      (select(notes)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
