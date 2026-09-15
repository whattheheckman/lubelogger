import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lubelogger/features/notes/data/local_note_record_repository.dart';
import 'package:lubelogger/features/notes/domain/note_record.dart';

part 'notes_provider.g.dart';

@riverpod
Stream<List<NoteRecord>> noteList(NoteListRef ref, int vehicleId) {
  final repo = ref.watch(localNoteRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class NotesNotifier extends _$NotesNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(NoteRecord record) async {
    final repo = ref.read(localNoteRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localNoteRecordRepositoryProvider);
    await repo.delete(id);
  }
}
