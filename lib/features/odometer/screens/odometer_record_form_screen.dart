import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../data/local_odometer_record_repository.dart';
import '../domain/odometer_record.dart';
import '../providers/odometer_records_provider.dart';

class OdometerRecordFormScreen extends ConsumerStatefulWidget {
  const OdometerRecordFormScreen(
      {super.key, required this.vehicleId, this.recordId});
  final int vehicleId;
  final int? recordId;

  @override
  ConsumerState<OdometerRecordFormScreen> createState() =>
      _OdometerRecordFormScreenState();
}

class _OdometerRecordFormScreenState
    extends ConsumerState<OdometerRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mileageController = TextEditingController(text: '0');
  final _initialMileageController = TextEditingController(text: '0');
  final _notesController = TextEditingController();
  DateTime _date = DateTime.now();
  bool _isLoading = false;
  OdometerRecord? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.recordId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localOdometerRecordRepositoryProvider)
        .getById(widget.recordId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _mileageController.text = record.mileage.toStringAsFixed(0);
      _initialMileageController.text = record.initialMileage.toStringAsFixed(0);
      _notesController.text = record.notes;
      _date = record.date;
    });
  }

  @override
  void dispose() {
    _mileageController.dispose();
    _initialMileageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final record = _existing?.copyWith(
            date: _date,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            initialMileage:
                double.tryParse(_initialMileageController.text) ?? 0,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          ) ??
          OdometerRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            date: _date,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            initialMileage:
                double.tryParse(_initialMileageController.text) ?? 0,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          );
      await ref.read(odometerRecordsNotifierProvider.notifier).save(record);
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recordId == null
            ? 'Add Odometer Reading'
            : 'Edit Odometer Reading'),
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
              controller: _mileageController,
              decoration: const InputDecoration(
                  labelText: 'Current Mileage',
                  border: OutlineInputBorder(),
                  suffixText: 'mi'),
              keyboardType: TextInputType.number,
              validator: (v) {
                final n = double.tryParse(v ?? '');
                if (n == null) return 'Enter a valid number';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _initialMileageController,
              decoration: const InputDecoration(
                  labelText: 'Initial Mileage (if new vehicle)',
                  border: OutlineInputBorder(),
                  suffixText: 'mi'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
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
