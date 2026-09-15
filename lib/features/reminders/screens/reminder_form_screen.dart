import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:lubelogger/core/utils/input_formatters.dart';

import 'package:lubelogger/features/reminders/data/local_reminder_record_repository.dart';
import 'package:lubelogger/features/reminders/domain/reminder_record.dart';
import 'package:lubelogger/features/reminders/providers/reminders_provider.dart';

class ReminderFormScreen extends ConsumerStatefulWidget {
  const ReminderFormScreen(
      {super.key, required this.vehicleId, this.reminderId});
  final int vehicleId;
  final int? reminderId;

  @override
  ConsumerState<ReminderFormScreen> createState() =>
      _ReminderFormScreenState();
}

class _ReminderFormScreenState extends ConsumerState<ReminderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  final _dateController = TextEditingController();
  final _mileageController = TextEditingController();
  final _notesController = TextEditingController();
  String _metric = 'date'; // 'date', 'mileage', 'both'
  DateTime? _dateDue;
  bool _isRecurring = false;
  bool _isLoading = false;
  ReminderRecord? _existing;

  String _formatDate(DateTime d) => DateFormat.yMMMd().format(d);

  @override
  void initState() {
    super.initState();
    if (widget.reminderId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localReminderRecordRepositoryProvider)
        .getById(widget.reminderId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _descController.text = record.description;
      _mileageController.text =
          record.mileageMetric?.toStringAsFixed(0) ?? '';
      _notesController.text = record.notes;
      _metric = record.reminderMetric;
      _dateDue = record.dateMetric;
      _dateController.text = _dateDue != null ? _formatDate(_dateDue!) : '';
      _isRecurring = record.isRecurring;
    });
  }

  @override
  void dispose() {
    _descController.dispose();
    _dateController.dispose();
    _mileageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateDue ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateDue = picked;
        _dateController.text = _formatDate(_dateDue!);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final record = _existing?.copyWith(
            description: _descController.text.trim(),
            reminderMetric: _metric,
            dateMetric:
                (_metric == 'date' || _metric == 'both') ? _dateDue : null,
            mileageMetric: (_metric == 'mileage' || _metric == 'both')
                ? double.tryParse(_mileageController.text)
                : null,
            isRecurring: _isRecurring,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          ) ??
          ReminderRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            description: _descController.text.trim(),
            reminderMetric: _metric,
            dateMetric:
                (_metric == 'date' || _metric == 'both') ? _dateDue : null,
            mileageMetric: (_metric == 'mileage' || _metric == 'both')
                ? double.tryParse(_mileageController.text)
                : null,
            isRecurring: _isRecurring,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          );
      await ref.read(remindersProvider.notifier).save(record);
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reminderId == null ? 'Add Reminder' : 'Edit Reminder'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                icon: Icon(Icons.description_outlined),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            const Text('Reminder Type',
                style: TextStyle(fontWeight: FontWeight.bold)),
            RadioGroup<String>(onChanged: (v) => setState(() => _metric = v!), groupValue: _metric, child:Column(crossAxisAlignment: CrossAxisAlignment.start, children : [RadioListTile(
              title: const Text('Date-based'),
              value: 'date',

            ),
            RadioListTile(
              title: const Text('Mileage-based'),
              value: 'mileage',

            ),
            RadioListTile(
              title: const Text('Both'),
              value: 'both',

            ),],)),
            
            const SizedBox(height: 8),
            if (_metric == 'date' || _metric == 'both') ...[
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: _pickDate,
                decoration: const InputDecoration(
                  labelText: 'Due Date',
                  hintText: 'Tap to select',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 12),
            ],
            if (_metric == 'mileage' || _metric == 'both') ...[
              TextFormField(
                controller: _mileageController,
                decoration: const InputDecoration(
                  labelText: 'Due at Mileage',
                  border: OutlineInputBorder(),
                  suffixText: 'mi',
                  icon: Icon(Symbols.speed),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [digitsOnlyFormatter],
              ),
              const SizedBox(height: 12),
            ],
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Recurring'),
              value: _isRecurring,
              onChanged: (v) => setState(() => _isRecurring = v),
            ),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
