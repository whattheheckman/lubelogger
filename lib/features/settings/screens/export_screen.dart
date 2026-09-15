import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:lubelogger/features/gas_records/data/local_gas_record_repository.dart';
import 'package:lubelogger/features/odometer/data/local_odometer_record_repository.dart';
import 'package:lubelogger/features/repair_records/data/local_repair_record_repository.dart';
import 'package:lubelogger/features/service_records/data/local_service_record_repository.dart';
import 'package:lubelogger/features/tax_records/data/local_tax_record_repository.dart';
import 'package:lubelogger/features/upgrade_records/data/local_upgrade_record_repository.dart';
import 'package:lubelogger/features/vehicles/domain/vehicle.dart';
import 'package:lubelogger/features/vehicles/providers/vehicles_provider.dart';

class ExportScreen extends ConsumerStatefulWidget {
  const ExportScreen({super.key});

  @override
  ConsumerState<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends ConsumerState<ExportScreen> {
  Vehicle? _selectedVehicle;
  final _loading = <String, bool>{};

  static final _dateFmt = DateFormat('yyyy-MM-dd HH:mm');

  // RFC 4180 CSV cell escaping
  String _cell(String s) {
    if (s.contains(',') || s.contains('"') || s.contains('\n')) {
      return '"${s.replaceAll('"', '""')}"';
    }
    return s;
  }

  String _row(List<String> cells) => cells.map(_cell).join(',');

  Future<void> _share(StringBuffer csv, String fileName) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(csv.toString());
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)], subject: fileName),
    );
  }

  String _fileName(String type) {
    final v = _selectedVehicle!;
    final base = '${v.year}_${v.make}_${v.model}'.replaceAll(' ', '_');
    return '${base}_$type.csv';
  }

  Future<void> _export(String key, Future<void> Function() fn) async {
    if (_loading.isNotEmpty) return;
    setState(() => _loading[key] = true);
    try {
      await fn();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading.remove(key));
    }
  }

  Future<void> _exportFuel() async {
    final records = await ref
        .read(localGasRecordRepositoryProvider)
        .getByVehicle(_selectedVehicle!.id);
    records.sort((a, b) => a.date.compareTo(b.date));
    final buf = StringBuffer()
      ..writeln(_row([
        'Date', 'Odometer (mi)', 'Gallons', 'Cost', 'MPG',
        'Fill To Full', 'Missed Fill-up', 'Notes',
      ]));
    for (final r in records) {
      buf.writeln(_row([
        _dateFmt.format(r.date),
        r.mileage.toStringAsFixed(0),
        r.gallons.toStringAsFixed(3),
        r.cost.toStringAsFixed(2),
        r.mpg?.toStringAsFixed(2) ?? '',
        r.isFillToFull ? 'Yes' : 'No',
        r.missedFuelUp ? 'Yes' : 'No',
        r.notes,
      ]));
    }
    await _share(buf, _fileName('fuel'));
  }

  Future<void> _exportService() async {
    final records = await ref
        .read(localServiceRecordRepositoryProvider)
        .getByVehicle(_selectedVehicle!.id);
    records.sort((a, b) => a.date.compareTo(b.date));
    final buf = StringBuffer()
      ..writeln(_row(['Date', 'Odometer (mi)', 'Description', 'Cost', 'Tags', 'Notes']));
    for (final r in records) {
      buf.writeln(_row([
        _dateFmt.format(r.date),
        r.mileage.toStringAsFixed(0),
        r.description,
        r.cost.toStringAsFixed(2),
        r.tags.join('; '),
        r.notes,
      ]));
    }
    await _share(buf, _fileName('service'));
  }

  Future<void> _exportRepair() async {
    final records = await ref
        .read(localRepairRecordRepositoryProvider)
        .getByVehicle(_selectedVehicle!.id);
    records.sort((a, b) => a.date.compareTo(b.date));
    final buf = StringBuffer()
      ..writeln(_row(['Date', 'Odometer (mi)', 'Description', 'Cost', 'Tags', 'Notes']));
    for (final r in records) {
      buf.writeln(_row([
        _dateFmt.format(r.date),
        r.mileage.toStringAsFixed(0),
        r.description,
        r.cost.toStringAsFixed(2),
        r.tags.join('; '),
        r.notes,
      ]));
    }
    await _share(buf, _fileName('repairs'));
  }

  Future<void> _exportUpgrades() async {
    final records = await ref
        .read(localUpgradeRecordRepositoryProvider)
        .getByVehicle(_selectedVehicle!.id);
    records.sort((a, b) => a.date.compareTo(b.date));
    final buf = StringBuffer()
      ..writeln(_row(['Date', 'Odometer (mi)', 'Description', 'Cost', 'Tags', 'Notes']));
    for (final r in records) {
      buf.writeln(_row([
        _dateFmt.format(r.date),
        r.mileage.toStringAsFixed(0),
        r.description,
        r.cost.toStringAsFixed(2),
        r.tags.join('; '),
        r.notes,
      ]));
    }
    await _share(buf, _fileName('upgrades'));
  }

  Future<void> _exportOdometer() async {
    final records = await ref
        .read(localOdometerRecordRepositoryProvider)
        .getByVehicle(_selectedVehicle!.id);
    records.sort((a, b) => a.date.compareTo(b.date));
    final buf = StringBuffer()
      ..writeln(_row(['Date', 'Odometer (mi)', 'Notes']));
    for (final r in records) {
      buf.writeln(_row([
        _dateFmt.format(r.date),
        r.mileage.toStringAsFixed(0),
        r.notes,
      ]));
    }
    await _share(buf, _fileName('odometer'));
  }

  Future<void> _exportTax() async {
    final records = await ref
        .read(localTaxRecordRepositoryProvider)
        .getByVehicle(_selectedVehicle!.id);
    records.sort((a, b) => a.date.compareTo(b.date));
    final buf = StringBuffer()
      ..writeln(_row([
        'Date', 'Description', 'Cost', 'Recurring', 'Recurring Interval', 'Notes',
      ]));
    for (final r in records) {
      buf.writeln(_row([
        _dateFmt.format(r.date),
        r.description,
        r.cost.toStringAsFixed(2),
        r.isRecurring ? 'Yes' : 'No',
        r.recurringInterval,
        r.notes,
      ]));
    }
    await _share(buf, _fileName('tax'));
  }

  @override
  Widget build(BuildContext context) {
    final asyncVehicles = ref.watch(vehicleListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Export Data')),
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
                  'Export as CSV',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _ExportTile(
                  icon: Icons.local_gas_station,
                  label: 'Fuel Records',
                  loading: _loading.containsKey('fuel'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _export('fuel', _exportFuel),
                ),
                _ExportTile(
                  icon: Icons.build_outlined,
                  label: 'Service Records',
                  loading: _loading.containsKey('service'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _export('service', _exportService),
                ),
                _ExportTile(
                  icon: Icons.car_repair,
                  label: 'Repair Records',
                  loading: _loading.containsKey('repair'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _export('repair', _exportRepair),
                ),
                _ExportTile(
                  icon: Icons.upgrade,
                  label: 'Upgrade Records',
                  loading: _loading.containsKey('upgrade'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _export('upgrade', _exportUpgrades),
                ),
                _ExportTile(
                  icon: Icons.speed,
                  label: 'Odometer Records',
                  loading: _loading.containsKey('odometer'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _export('odometer', _exportOdometer),
                ),
                _ExportTile(
                  icon: Icons.receipt_long_outlined,
                  label: 'Tax Records',
                  loading: _loading.containsKey('tax'),
                  disabled: _loading.isNotEmpty,
                  onTap: () => _export('tax', _exportTax),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _ExportTile extends StatelessWidget {
  const _ExportTile({
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
                Icons.download_outlined,
                color: disabled ? Colors.grey : Theme.of(context).colorScheme.primary,
              ),
        onTap: disabled ? null : onTap,
      ),
    );
  }
}
