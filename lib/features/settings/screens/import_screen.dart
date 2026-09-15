import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/features/gas_records/data/local_gas_record_repository.dart';
import 'package:lubelogger/features/gas_records/domain/gas_record.dart';
import 'package:lubelogger/features/vehicles/domain/vehicle.dart';
import 'package:lubelogger/features/vehicles/providers/vehicles_provider.dart';

class ImportScreen extends ConsumerStatefulWidget {
  const ImportScreen({super.key});

  @override
  ConsumerState<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends ConsumerState<ImportScreen> {
  Vehicle? _selectedVehicle;
  final _loading = <String, bool>{};

  // ── CSV parser (RFC 4180) ────────────────────────────────────────────────

  List<List<String>> _parseCsv(String content) {
    final result = <List<String>>[];
    final text = content.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    var i = 0;

    while (i < text.length) {
      final row = <String>[];
      while (i < text.length && text[i] != '\n') {
        if (text[i] == '"') {
          i++; // skip opening quote
          final buf = StringBuffer();
          while (i < text.length) {
            if (text[i] == '"') {
              if (i + 1 < text.length && text[i + 1] == '"') {
                buf.write('"');
                i += 2;
              } else {
                i++; // skip closing quote
                break;
              }
            } else {
              buf.write(text[i]);
              i++;
            }
          }
          row.add(buf.toString());
          if (i < text.length && text[i] == ',') i++;
        } else {
          final start = i;
          while (i < text.length && text[i] != ',' && text[i] != '\n') {
            i++;
          }
          row.add(text.substring(start, i));
          if (i < text.length && text[i] == ',') i++;
        }
      }
      if (i < text.length && text[i] == '\n') i++;
      if (row.isNotEmpty) result.add(row);
    }
    return result;
  }

  // ── Header utilities ─────────────────────────────────────────────────────

  String _norm(String h) => h.trim().toLowerCase();

  int? _findCol(List<String> headers, List<String> aliases) {
    for (final alias in aliases) {
      final idx = headers.indexOf(alias);
      if (idx >= 0) return idx;
    }
    return null;
  }

  // ── Value parsers ────────────────────────────────────────────────────────

  String _cell(List<String> row, int? col) =>
      (col != null && col < row.length) ? row[col].trim() : '';

  bool _parseBool(String s) {
    final v = s.trim().toLowerCase();
    return v == 'true' || v == 'yes' || v == '1' || v == 'y';
  }

  static final _dateFmts = [
    DateFormat('yyyy-MM-dd HH:mm'),
    DateFormat('yyyy-MM-dd HH:mm:ss'),
    DateFormat("yyyy-MM-dd'T'HH:mm:ss"),
    DateFormat('yyyy-MM-dd'),
    DateFormat('MM/dd/yyyy HH:mm'),
    DateFormat('MM/dd/yyyy'),
    DateFormat('M/d/yyyy'),
    DateFormat('dd/MM/yyyy'),
    DateFormat('d/M/yyyy'),
    DateFormat('dd-MM-yyyy'),
    DateFormat('MM-dd-yyyy'),
  ];

  DateTime? _parseDate(String s) {
    if (s.isEmpty) return null;
    for (final fmt in _dateFmts) {
      try {
        return fmt.parseStrict(s);
      } catch (_) {}
    }
    return DateTime.tryParse(s);
  }

  // ── Fuel CSV parser ──────────────────────────────────────────────────────

  ({List<GasRecord> records, List<String> errors}) _parseFuelCsv(
    String content,
    int vehicleId,
  ) {
    final rows = _parseCsv(content);
    if (rows.isEmpty) return (records: [], errors: ['File is empty']);

    final headers = rows.first.map(_norm).toList();
    final records = <GasRecord>[];
    final errors = <String>[];

    final dateCol = _findCol(headers, ['date', 'fuelup_date']);
    final dayCol = _findCol(headers, ['day']);
    final monthCol = _findCol(headers, ['month']);
    final yearCol = _findCol(headers, ['year']);
    final odoCol = _findCol(headers, ['odometer', 'odo', 'Odometer (mi)']);
    final fuelCol = _findCol(headers, [
      'gallons',
      'liters',
      'litres',
      'consumption',
      'quantity',
      'qty',
      'fuelconsumed',
    ]);
    final costCol = _findCol(headers, [
      'cost',
      'total cost',
      'totalcost',
      'total price',
    ]);
    final notesCol = _findCol(headers, ['notes', 'note']);
    final partialCol = _findCol(headers, [
      'partial_fuelup',
      'partial tank',
      'partial_fill',
    ]);
    final fillCol = _findCol(headers, ['isfilltofull', 'filled up']);
    final missedCol = _findCol(headers, [
      'missedfuelup',
      'missed_fuelup',
      'missed fill up',
      'missed_fill',
    ]);

    for (var i = 1; i < rows.length; i++) {
      final row = rows[i];
      if (row.every((c) => c.isEmpty)) continue;

      // Date — prefer combined column, fall back to day/month/year columns
      DateTime? date;
      if (dateCol != null) {
        date = _parseDate(_cell(row, dateCol));
      } else if (dayCol != null && monthCol != null && yearCol != null) {
        final day = int.tryParse(_cell(row, dayCol));
        final month = int.tryParse(_cell(row, monthCol));
        final year = int.tryParse(_cell(row, yearCol));
        if (day != null && month != null && year != null) {
          date = DateTime(year, month, day);
        }
      }
      if (date == null) {
        errors.add('Row ${i + 1}: could not parse date — skipped');
        continue;
      }

      // Odometer
      final odoStr = _cell(row, odoCol);
      final odometer = double.tryParse(odoStr);
      if (odometer == null) {
        errors.add('Row ${i + 1}: invalid odometer "${odoStr.isEmpty ? "(empty)" : odoStr}" — skipped');
        continue;
      }

      final fuel = double.tryParse(_cell(row, fuelCol)) ?? 0.0;
      final cost = double.tryParse(_cell(row, costCol)) ?? 0.0;
      final notes = _cell(row, notesCol);

      // isFillToFull — partial_fuelup is the inverse; fillCol is direct
      bool isFillToFull;
      if (partialCol != null) {
        isFillToFull = !_parseBool(_cell(row, partialCol));
      } else if (fillCol != null) {
        isFillToFull = _parseBool(_cell(row, fillCol));
      } else {
        isFillToFull = true;
      }

      final missedFuelUp = _parseBool(_cell(row, missedCol));

      records.add(GasRecord(
        id: 0,
        vehicleId: vehicleId,
        date: date,
        mileage: odometer,
        gallons: fuel,
        cost: cost,
        isFillToFull: isFillToFull,
        missedFuelUp: missedFuelUp,
        notes: notes,
        updatedAt: DateTime.now(),
      ));
    }

    return (records: records, errors: errors);
  }

  // ── Import orchestration ─────────────────────────────────────────────────

  Future<void> _runImport(String key, Future<void> Function() fn) async {
    if (_loading.isNotEmpty) return;
    setState(() => _loading[key] = true);
    try {
      await fn();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Import failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading.remove(key));
    }
  }

  Future<String?> _pickCsvContent() async {
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['csv', 'txt'],
    );
    if (file == null) return null;

    final bytes = await file.readAsBytes();
    return utf8.decode(bytes, allowMalformed: true);
  }

  Future<void> _importFuel() async {
    final content = await _pickCsvContent();
    if (content == null) return;

    final vehicleId = _selectedVehicle!.id;
    final (:records, :errors) = _parseFuelCsv(content, vehicleId);

    if (!mounted) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => _ImportPreviewDialog(
        recordType: 'Fuel Records',
        count: records.length,
        errors: errors,
      ),
    );
    if (confirmed != true || records.isEmpty) return;

    final repo = ref.read(localGasRecordRepositoryProvider);
    for (final r in records) {
      await repo.create(r);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imported ${records.length} fuel record(s).')),
      );
    }
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final asyncVehicles = ref.watch(vehicleListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Import Data')),
      body: asyncVehicles.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (vehicles) {
          if (vehicles.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.directions_car, size: 48, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No vehicles found.'),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DropdownMenu<Vehicle>(
                initialSelection: _selectedVehicle,
                label: const Text('Vehicle'),
                leadingIcon: const Icon(Icons.directions_car),
                expandedInsets: EdgeInsets.zero,
                onSelected: (v) => setState(() => _selectedVehicle = v),
                dropdownMenuEntries: vehicles
                    .map((v) => DropdownMenuEntry(
                          value: v,
                          label: '${v.year} ${v.make} ${v.model}',
                        ))
                    .toList(),
              ),
              if (_selectedVehicle != null) ...[
                const SizedBox(height: 24),
                Text(
                  'Import from CSV',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _ImportTile(
                  icon: Icons.local_gas_station,
                  label: 'Fuel Records',
                  loading: _loading.containsKey('fuel'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _runImport('fuel', _importFuel),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

// ── Preview / confirmation dialog ────────────────────────────────────────────

class _ImportPreviewDialog extends StatelessWidget {
  const _ImportPreviewDialog({
    required this.recordType,
    required this.count,
    required this.errors,
  });

  final String recordType;
  final int count;
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Import $recordType'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count record(s) ready to import.'),
            if (errors.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                '${errors.length} row(s) skipped:',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              ...errors.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(e, style: Theme.of(context).textTheme.bodySmall),
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        if (count > 0)
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Import'),
          ),
      ],
    );
  }
}

// ── Import tile widget ───────────────────────────────────────────────────────

class _ImportTile extends StatelessWidget {
  const _ImportTile({
    required this.icon,
    required this.label,
    required this.loading,
    required this.disabled,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool loading;
  final bool disabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: disabled && !loading ? Colors.grey : null),
        title: Text(
          label,
          style: disabled && !loading
              ? TextStyle(color: Theme.of(context).disabledColor)
              : null,
        ),
        trailing: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(
                Icons.upload_outlined,
                color: disabled
                    ? Colors.grey
                    : Theme.of(context).colorScheme.primary,
              ),
        onTap: disabled ? null : onTap,
      ),
    );
  }
}
