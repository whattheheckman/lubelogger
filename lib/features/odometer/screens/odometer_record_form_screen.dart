import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:lubelogger/core/utils/input_formatters.dart';

import 'package:lubelogger/features/odometer/data/local_odometer_record_repository.dart';
import 'package:lubelogger/features/odometer/domain/odometer_record.dart';
import 'package:lubelogger/features/odometer/providers/odometer_records_provider.dart';

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
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _mileageController = TextEditingController(text: '0');
  final _initialMileageController = TextEditingController(text: '0');
  final _notesController = TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  bool _isLoading = false;
  bool _hasExistingRecords = false;
  OdometerRecord? _existing;

  String _formatDate(DateTime d) => DateFormat.yMMMd().format(d);
  String _formatTime(TimeOfDay t) => t.format(context);

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.fromDateTime(_date);
    _dateController.text = _formatDate(_date);
    if (widget.recordId != null) {
      Future.microtask(_loadExisting);
    } else {
      Future.microtask(_checkExistingRecords);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _timeController.text = _formatTime(_time);
  }

  Future<void> _checkExistingRecords() async {
    final records = await ref
        .read(localOdometerRecordRepositoryProvider)
        .getByVehicle(widget.vehicleId);
    if (!mounted) return;
    setState(() => _hasExistingRecords = records.isNotEmpty);
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
      _time = TimeOfDay.fromDateTime(record.date);
      _dateController.text = _formatDate(_date);
      _timeController.text = _formatTime(_time);
      _hasExistingRecords = true;
    });
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
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
    if (picked != null) {
      setState(() {
        _date = picked;
        _dateController.text = _formatDate(_date);
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null) {
      setState(() {
        _time = picked;
        _timeController.text = _formatTime(_time);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final combined = DateTime(
        _date.year, _date.month, _date.day, _time.hour, _time.minute);
      final record = _existing?.copyWith(
            date: combined,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            initialMileage:
                double.tryParse(_initialMileageController.text) ?? 0,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          ) ??
          OdometerRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            date: combined,
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
            const SizedBox(height: 12),
            TextFormField(
              controller: _timeController,
              readOnly: true,
              onTap: _pickTime,
              decoration: const InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            TextFormField(
              controller: _mileageController,
              decoration: const InputDecoration(
                labelText: 'Current Mileage',
                border: OutlineInputBorder(),
                suffixText: 'mi',
                icon: Icon(Symbols.speed),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [digitsOnlyFormatter],
              validator: (v) {
                final n = double.tryParse(v ?? '');
                if (n == null) return 'Enter a valid number';
                return null;
              },
            ),
            const SizedBox(height: 12),
            if (_hasExistingRecords)
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Initial Mileage: ${_initialMileageController.text} mi',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              )
            else
              TextFormField(
                controller: _initialMileageController,
                decoration: const InputDecoration(
                  labelText: 'Initial Mileage (if new vehicle)',
                  border: OutlineInputBorder(),
                  suffixText: 'mi',
                  icon: Icon(Symbols.speed),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [digitsOnlyFormatter],
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
