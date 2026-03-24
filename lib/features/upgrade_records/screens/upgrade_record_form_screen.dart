import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/input_formatters.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/settings/settings_repository.dart';
import '../../../features/odometer/data/local_odometer_record_repository.dart';
import '../../../features/odometer/domain/odometer_record.dart' as odom;
import '../data/local_upgrade_record_repository.dart';
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
  UpgradeRecord? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.recordId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localUpgradeRecordRepositoryProvider)
        .getById(widget.recordId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _descController.text = record.description;
      _mileageController.text = record.mileage.toStringAsFixed(0);
      _costController.text = record.cost.toStringAsFixed(2);
      _notesController.text = record.notes;
      _date = record.date;
    });
  }

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
      final record = _existing?.copyWith(
            date: _date,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            description: _descController.text.trim(),
            cost: double.tryParse(_costController.text) ?? 0,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          ) ??
          UpgradeRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            date: _date,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            description: _descController.text.trim(),
            cost: double.tryParse(_costController.text) ?? 0,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          );
      await ref.read(upgradeRecordsNotifierProvider.notifier).save(record);
      final mileage = double.tryParse(_mileageController.text) ?? 0;
      final autoAdd = ref.read(settingsRepositoryProvider).current.autoAddOdometerRecords;
      if (autoAdd && mileage > 0) {
        await ref.read(localOdometerRecordRepositoryProvider).create(
              odom.OdometerRecord(
                id: 0,
                vehicleId: widget.vehicleId,
                date: _date,
                mileage: mileage,
                notes: 'automatically added from upgrade records',
                updatedAt: DateTime.now(),
              ),
            );
      }
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recordId == null ? 'Add Upgrade' : 'Edit Upgrade'),
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
              inputFormatters: [digitsOnlyFormatter],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('\$', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _costController,
                    decoration: const InputDecoration(
                        labelText: 'Cost', border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    inputFormatters: [CurrencyInputFormatter()],
                  ),
                ),
              ],
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
