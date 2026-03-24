import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/input_formatters.dart';

import '../data/local_tax_record_repository.dart';
import '../domain/tax_record.dart';
import '../providers/tax_records_provider.dart';

class TaxRecordFormScreen extends ConsumerStatefulWidget {
  const TaxRecordFormScreen(
      {super.key, required this.vehicleId, this.recordId});
  final int vehicleId;
  final int? recordId;

  @override
  ConsumerState<TaxRecordFormScreen> createState() =>
      _TaxRecordFormScreenState();
}

class _TaxRecordFormScreenState extends ConsumerState<TaxRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  final _costController = TextEditingController(text: '0.00');
  final _intervalController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _date = DateTime.now();
  bool _isRecurring = false;
  bool _isLoading = false;
  TaxRecord? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.recordId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localTaxRecordRepositoryProvider)
        .getById(widget.recordId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _descController.text = record.description;
      _costController.text = record.cost.toStringAsFixed(2);
      _intervalController.text = record.recurringInterval;
      _notesController.text = record.notes;
      _date = record.date;
      _isRecurring = record.isRecurring;
    });
  }

  @override
  void dispose() {
    _descController.dispose();
    _costController.dispose();
    _intervalController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final record = _existing?.copyWith(
            date: _date,
            description: _descController.text.trim(),
            cost: double.tryParse(_costController.text) ?? 0,
            isRecurring: _isRecurring,
            recurringInterval:
                _isRecurring ? _intervalController.text.trim() : '',
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          ) ??
          TaxRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            date: _date,
            description: _descController.text.trim(),
            cost: double.tryParse(_costController.text) ?? 0,
            isRecurring: _isRecurring,
            recurringInterval:
                _isRecurring ? _intervalController.text.trim() : '',
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          );
      await ref.read(taxRecordsNotifierProvider.notifier).save(record);
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.recordId == null ? 'Add Tax Record' : 'Edit Tax Record'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Date'),
              subtitle: Text(DateFormat.yMMMd().format(_date)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            const Divider(),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                  labelText: 'Description', border: OutlineInputBorder()),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _costController,
              decoration: const InputDecoration(
                  labelText: 'Cost',
                  border: OutlineInputBorder(),
                  prefixText: '\$'),
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyInputFormatter()],
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Recurring'),
              value: _isRecurring,
              onChanged: (v) => setState(() => _isRecurring = v),
            ),
            if (_isRecurring) ...[
              TextFormField(
                controller: _intervalController,
                decoration: const InputDecoration(
                    labelText: 'Interval (e.g. 1 year, 6 months)',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
            ],
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                  labelText: 'Notes', border: OutlineInputBorder()),
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
