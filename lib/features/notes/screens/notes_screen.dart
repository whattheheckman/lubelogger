import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/notes_provider.dart';
import '../domain/note_record.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key, required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncNotes = ref.watch(noteListProvider(vehicleId));

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/vehicles/$vehicleId/notes/add'),
        child: const Icon(Icons.add),
      ),
      body: asyncNotes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (notes) {
          if (notes.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notes, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No notes yet.\nTap + to add one.',
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(noteListProvider(vehicleId)),
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, i) =>
                  _NoteCard(note: notes[i], vehicleId: vehicleId, ref: ref),
            ),
          );
        },
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard(
      {required this.note, required this.vehicleId, required this.ref});
  final NoteRecord note;
  final int vehicleId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat.yMMMd();
    return Dismissible(
      key: Key('note_${note.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async => await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Delete')),
          ],
        ),
      ),
      onDismissed: (_) =>
          ref.read(notesNotifierProvider.notifier).delete(note.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ExpansionTile(
          title: Text(note.title,
              style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(fmt.format(note.updatedAt)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, size: 18),
                onPressed: () => context
                    .push('/vehicles/$vehicleId/notes/${note.id}/edit'),
              ),
              const Icon(Icons.expand_more),
            ],
          ),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: note.body.isNotEmpty
                  ? MarkdownBody(data: note.body)
                  : const Text('No content.',
                      style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
