import '../domain/note_record.dart';

abstract interface class NoteRecordRepository {
  Stream<List<NoteRecord>> watchByVehicle(int vehicleId);
  Future<List<NoteRecord>> getByVehicle(int vehicleId);
  Future<NoteRecord?> getById(int id);
  Future<int> create(NoteRecord record);
  Future<void> update(NoteRecord record);
  Future<void> delete(int id);
}
