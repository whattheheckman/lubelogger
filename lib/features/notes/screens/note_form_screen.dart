import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

import '../data/local_note_record_repository.dart';
import '../domain/note_record.dart';
import '../providers/notes_provider.dart';

class NoteFormScreen extends ConsumerStatefulWidget {
  const NoteFormScreen({super.key, required this.vehicleId, this.noteId});
  final int vehicleId;
  final int? noteId;

  @override
  ConsumerState<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends ConsumerState<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool _isLoading = false;
  bool _previewMode = false;
  NoteRecord? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.noteId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localNoteRecordRepositoryProvider)
        .getById(widget.noteId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _titleController.text = record.title;
      _bodyController.text = record.body;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final note = _existing?.copyWith(
            title: _titleController.text.trim(),
            body: _bodyController.text,
            updatedAt: DateTime.now(),
          ) ??
          NoteRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            title: _titleController.text.trim(),
            body: _bodyController.text,
            updatedAt: DateTime.now(),
          );
      await ref.read(notesNotifierProvider.notifier).save(note);
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noteId == null ? 'Add Note' : 'Edit Note'),
        actions: [
          IconButton(
            icon: Icon(_previewMode ? Icons.edit : Icons.preview),
            tooltip: _previewMode ? 'Edit' : 'Preview',
            onPressed: () => setState(() => _previewMode = !_previewMode),
          ),
          IconButton(
            icon: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.save),
            onPressed: _isLoading ? null : _submit,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
              ),
            ),
            Expanded(
              child: _previewMode
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: _bodyController.text.isNotEmpty
                          ? Markdown(data: _bodyController.text)
                          : const Center(
                              child: Text('Nothing to preview.',
                                  style: TextStyle(color: Colors.grey))),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _bodyController,
                        decoration: const InputDecoration(
                          hintText: 'Write in Markdown...',
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
