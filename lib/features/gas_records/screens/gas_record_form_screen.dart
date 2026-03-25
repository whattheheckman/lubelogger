import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../core/settings/settings_repository.dart';
import '../../../core/utils/input_formatters.dart';
import '../../../features/odometer/data/local_odometer_record_repository.dart';
import '../../../features/odometer/domain/odometer_record.dart' as odom;
import '../data/local_gas_record_repository.dart';
import '../domain/gas_record.dart';
import '../providers/gas_records_provider.dart';

class GasRecordFormScreen extends ConsumerStatefulWidget {
  const GasRecordFormScreen({
    super.key,
    required this.vehicleId,
    this.recordId,
  });

  final int vehicleId;
  final int? recordId;

  @override
  ConsumerState<GasRecordFormScreen> createState() =>
      _GasRecordFormScreenState();
}

class _GasRecordFormScreenState extends ConsumerState<GasRecordFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mileageController = TextEditingController();
  final _gallonsController = TextEditingController();
  final _costController = TextEditingController();
  final _notesController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  bool _isFillToFull = true;
  bool _missedFuelUp = false;
  bool _isLoading = false;
  GasRecord? _existing;

  String _formatDate(DateTime d) => DateFormat.yMMMd().format(d);
  String _formatTime(TimeOfDay t) =>
      DateFormat('h:mm a').format(DateTime(2000, 1, 1, t.hour, t.minute));

  @override
  void initState() {
    super.initState();
    _dateController.text = _formatDate(_date);
    _timeController.text = _formatTime(_time);
    if (widget.recordId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final record = await ref
        .read(localGasRecordRepositoryProvider)
        .getById(widget.recordId!);
    if (record == null || !mounted) return;
    setState(() {
      _existing = record;
      _mileageController.text = record.mileage.toStringAsFixed(0);
      _gallonsController.text = record.gallons.toStringAsFixed(3);
      _costController.text = record.cost.toStringAsFixed(2);
      _notesController.text = record.notes;
      _date = record.date;
      _time = TimeOfDay.fromDateTime(record.date);
      _dateController.text = _formatDate(_date);
      _timeController.text = _formatTime(_time);
      _isFillToFull = record.isFillToFull;
      _missedFuelUp = record.missedFuelUp;
    });
  }

  @override
  void dispose() {
    _mileageController.dispose();
    _gallonsController.dispose();
    _costController.dispose();
    _notesController.dispose();
    _dateController.dispose();
    _timeController.dispose();
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
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null) {
      setState(() {
      _time = picked;
      _timeController.text = _formatTime(_time);
    });
    }
  }

  DateTime get _dateTime =>
      DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute);

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final record =
          _existing?.copyWith(
            date: _dateTime,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            gallons: double.tryParse(_gallonsController.text) ?? 0,
            cost: double.tryParse(_costController.text) ?? 0,
            isFillToFull: _isFillToFull,
            missedFuelUp: _missedFuelUp,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          ) ??
          GasRecord(
            id: 0,
            vehicleId: widget.vehicleId,
            date: _dateTime,
            mileage: double.tryParse(_mileageController.text) ?? 0,
            gallons: double.tryParse(_gallonsController.text) ?? 0,
            cost: double.tryParse(_costController.text) ?? 0,
            isFillToFull: _isFillToFull,
            missedFuelUp: _missedFuelUp,
            notes: _notesController.text.trim(),
            updatedAt: DateTime.now(),
          );
      await ref.read(gasRecordsNotifierProvider.notifier).save(record);
      final mileage = double.tryParse(_mileageController.text) ?? 0;
      final autoAdd = ref
          .read(settingsRepositoryProvider)
          .current
          .autoAddOdometerRecords;
      if (autoAdd && mileage > 0) {
        await ref
            .read(localOdometerRecordRepositoryProvider)
            .create(
              odom.OdometerRecord(
                id: 0,
                vehicleId: widget.vehicleId,
                date: _dateTime,
                mileage: mileage,
                notes: 'automatically added from gas records',
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
          widget.recordId == null ? 'Add Fuel Record' : 'Edit Fuel Record',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: _pickDate,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    controller: _timeController,
                    readOnly: true,
                    onTap: _pickTime,
                    decoration: const InputDecoration(
                      labelText: 'Time',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            TextFormField(
              controller: _mileageController,
              decoration: InputDecoration(
                labelText: 'Odometer',
                border: const OutlineInputBorder(),
                suffixText: 'mi',
                icon: const Icon(Symbols.speed),
                hintText: 'e.g. 170237...'
              ),

              keyboardType: TextInputType.number,
              inputFormatters: [digitsOnlyFormatter],
              validator: (v) {
                final n = double.tryParse(v ?? '');
                if (n == null || n <= 0) return 'Enter a valid mileage';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _gallonsController,
              decoration: const InputDecoration(
                labelText: 'Gallons',
                border: OutlineInputBorder(),
                suffixText: 'gal',
                icon: Icon(Icons.local_gas_station_outlined),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyInputFormatter(decimalPlaces: 3)],
              validator: (v) {
                final n = double.tryParse(v ?? '');
                if (n == null || n <= 0) return 'Enter a valid quantity';
                return null;
              },
            ),
            const SizedBox(height: 12),

            Expanded(
              child: TextFormField(
                controller: _costController,
                decoration: const InputDecoration(
                  labelText: 'Cost',
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Symbols.universal_currency_alt_rounded,
                    size: 24,
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [CurrencyInputFormatter()],
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fill to Full'),
              subtitle: const Text('Tank was filled completely'),
              value: _isFillToFull,
              onChanged: (v) => setState(() {
                _isFillToFull = v;
                if (!v) _missedFuelUp = false;
              }),
            ),
            if (_isFillToFull)
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Missed Fill-up'),
                subtitle: const Text('Partial fill-up occurred before this'),
                value: _missedFuelUp,
                onChanged: (v) => setState(() => _missedFuelUp = v),
              ),
            const SizedBox(height: 8),
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
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
