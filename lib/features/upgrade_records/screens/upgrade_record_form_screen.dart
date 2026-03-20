import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../domain/upgrade_record.dart';
import '../providers/upgrade_records_provider.dart';

class UpgradeRecordFormScreen extends ConsumerStatefulWidget {
  const UpgradeRecordFormScreen(
      {super.key, required this.vehicleId, this.recordId});
  final int vehicleId;
  final int? recordId;

  @override
  ConsumerState<UpgradeRecordFormScreen> createState() =>
      _UpgradeRecordFormScreenState();
}

class _UpgradeRecordFormScreenState
    extends ConsumerState<UpgradeRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  final _mileageController = TextEditingController(text: '0');
  final _costController = TextEditingController(text: '0.00');
  final _notesController = TextEditingController();
  DateTime _date = DateTime.now();
  bool _isLoading = false;

  @override
  void dispose() {
    _descController.dispose();
    _mileageController.dispose();
    _costController.dispose();
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
      final record = UpgradeRecord(
        id: widget.recordId ?? 0,
        vehicleId: widget.vehicleId,
        date: _date,
        mileage: double.tryParse(_mileageController.text) ?? 0,
        description: _descController.text.trim(),
        cost: double.tryParse(_costController.text) ?? 0,
        notes: _notesController.text.trim(),
        updatedAt: DateTime.now(),
      );
      await ref.read(upgradeRecordsNotifierProvider.notifier).save(record);
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.recordId == null ? 'Add Upgrade' : 'Edit Upgrade'),
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
              controller: _mileageController,
              decoration: const InputDecoration(
                  labelText: 'Mileage',
                  border: OutlineInputBorder(),
                  suffixText: 'mi'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _costController,
              decoration: const InputDecoration(
                  labelText: 'Cost',
                  border: OutlineInputBorder(),
                  prefixText: '\$'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                  labelText: 'Notes', border: OutlineInputBorder()),
              maxLines: 3,
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
