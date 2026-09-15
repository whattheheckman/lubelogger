import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:lubelogger/core/utils/input_formatters.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/core/settings/settings_repository.dart';
import 'package:lubelogger/features/odometer/data/local_odometer_record_repository.dart';
import 'package:lubelogger/features/odometer/domain/odometer_record.dart' as odom;
import 'package:lubelogger/features/service_records/data/local_service_record_repository.dart';
import 'package:lubelogger/features/service_records/domain/service_record.dart';
import 'package:lubelogger/features/service_records/providers/service_records_provider.dart';

class ServiceRecordFormScreen extends ConsumerStatefulWidget {
  const ServiceRecordFormScreen(
      {super.key, required this.vehicleId, this.recordId});
  final int vehicleId;
  final int? recordId;

  @override
  ConsumerState<ServiceRecordFormScreen> createState() =>
      _ServiceRecordFormScreenState();
}

class _ServiceRecordFormScreenState
    extends ConsumerState<ServiceRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _descController = TextEditingController();
  final _mileageController = TextEditingController(text: '0');
  final _costController = TextEditingController(text: '0.00');
  final _notesController = TextEditingController();
  DateTime _date = DateTime.now();
  bool _isLoading = false;
  ServiceRecord? _existing;

  String _formatDate(DateTime d) => DateFormat.yMMMd().format(d);

  @override
  void initState() {
    super.initState();
    _dateController.text = _formatDate(_date);
    if (widget.recordId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localServiceRecordRepositoryProvider)
        .getById(widget.recordId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _descController.text = record.description;
      _mileageController.text = record.mileage.toStringAsFixed(0);
      _costController.text = record.cost.toStringAsFixed(2);
      _notesController.text = record.notes;
      _date = record.date;
      _dateController.text = _formatDate(_date);
    });
  }

  @override
  void dispose() {
    _dateController.dispose();
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
    if (picked != null) {
      setState(() {
        _date = picked;
        _dateController.text = _formatDate(_date);
      });
    }
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
          ServiceRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            date: _date,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            description: _descController.text.trim(),
            cost: double.tryParse(_costController.text) ?? 0,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          );
      await ref.read(serviceRecordsNotifierProvider.notifier).save(record);
      final mileage = double.tryParse(_mileageController.text) ?? 0;
      final autoAdd = ref.read(settingsRepositoryProvider).current.autoAddOdometerRecords;
      if (autoAdd && mileage > 0) {
        await ref.read(localOdometerRecordRepositoryProvider).create(
              odom.OdometerRecord(
                id: 0,
                vehicleId: widget.vehicleId,
                date: _date,
                mileage: mileage,
                notes: 'automatically added from service records',
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
        title: Text(
            widget.recordId == null ? 'Add Service Record' : 'Edit Service Record'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: _pickDate,
              decoration: const InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
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
            const SizedBox(height: 12),
            TextFormField(
              controller: _mileageController,
              decoration: const InputDecoration(
                labelText: 'Mileage',
                border: OutlineInputBorder(),
                suffixText: 'mi',
                icon: Icon(Symbols.speed),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [digitsOnlyFormatter],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _costController,
              decoration: const InputDecoration(
                labelText: 'Cost',
                border: OutlineInputBorder(),
                icon: Icon(Symbols.universal_currency_alt_rounded, size: 24, color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyInputFormatter()],
            ),
            const SizedBox(height: 12),
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
