import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/features/vehicles/providers/vehicles_provider.dart';
import 'package:lubelogger/features/vehicles/domain/vehicle.dart';
import 'package:lubelogger/features/gas_records/domain/gas_record.dart';
import 'package:lubelogger/features/gas_records/providers/gas_records_provider.dart';

class QuickAddFuelScreen extends ConsumerStatefulWidget {
  const QuickAddFuelScreen({super.key, this.vehicleId});
  final int? vehicleId;

  @override
  ConsumerState<QuickAddFuelScreen> createState() =>
      _QuickAddFuelScreenState();
}

class _QuickAddFuelScreenState extends ConsumerState<QuickAddFuelScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  int? _selectedVehicleId;

  // Values stored as strings so the numpad can build them character by character
  final _values = ['', '', ''];

  bool get _hasVehiclePicker => widget.vehicleId == null;
  int get _pageCount => _hasVehiclePicker ? 5 : 4; // picker + 3 inputs + summary

  void _onPageChanged(int page) => setState(() => _currentPage = page);

  void _input(String digit, int pageIndex) {
    setState(() {
      final current = _values[pageIndex];
      if (digit == '⌫') {
        _values[pageIndex] =
            current.isEmpty ? '' : current.substring(0, current.length - 1);
        return;
      }
      if (digit == '.' && current.contains('.')) return;
      if (digit == '.' && current.isEmpty) {
        _values[pageIndex] = '0.';
        return;
      }
      // Prevent multiple leading zeros
      if (current == '0' && digit != '.') {
        _values[pageIndex] = digit;
        return;
      }
      if (current.length >= 10) return; // cap display length
      _values[pageIndex] = current + digit;
    });
  }

  double _parse(int i) => double.tryParse(_values[i]) ?? 0;

  int get _resolvedVehicleId => widget.vehicleId ?? _selectedVehicleId!;

  Future<void> _save() async {
    final now = DateTime.now();
    final vehicleId = _resolvedVehicleId;
    final record = GasRecord(
      id: 0,
      vehicleId: vehicleId,
      date: now,
      mileage: _parse(0),
      cost: _parse(1),
      gallons: _parse(2),
      isFillToFull: true,
      updatedAt: now,
    );
    await ref.read(gasRecordsProvider.notifier).save(record);
    if (mounted) context.go(RouteNames.vehicleDetailPath(vehicleId));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      if (_hasVehiclePicker)
        _VehiclePickerPage(
          onSelect: (vehicle) {
            setState(() => _selectedVehicleId = vehicle.id);
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      _InputPage(
        label: 'Odometer',
        prefix: '',
        suffix: ' mi',
        value: _values[0],
        onDigit: (d) => _input(d, 0),
      ),
      _InputPage(
        label: 'Fuel Cost',
        prefix: '\$',
        suffix: '',
        value: _values[1],
        onDigit: (d) => _input(d, 1),
      ),
      _InputPage(
        label: 'Gallons',
        prefix: '',
        suffix: ' gal',
        value: _values[2],
        onDigit: (d) => _input(d, 2),
      ),
      _SummaryPage(
        odometer: _parse(0),
        cost: _parse(1),
        gallons: _parse(2),
        onCancel: () => context.pop(),
        onAdd: _save,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Quick Add Fuel')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: _hasVehiclePicker && _selectedVehicleId == null && _currentPage == 0
                  ? const NeverScrollableScrollPhysics()
                  : null,
              children: pages,
            ),
          ),
          _DotIndicator(count: _pageCount, current: _currentPage),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Vehicle picker page
// ─────────────────────────────────────────────────────────────

class _VehiclePickerPage extends ConsumerWidget {
  const _VehiclePickerPage({required this.onSelect});
  final void Function(Vehicle) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVehicles = ref.watch(vehicleListProvider);
    final theme = Theme.of(context);

    return asyncVehicles.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (vehicles) {
        if (vehicles.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_car, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text('No vehicles found.'),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Vehicle',
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: vehicles.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final v = vehicles[i];
                    return Material(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => onSelect(v),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(Icons.directions_car,
                                  color: theme.colorScheme.primary),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${v.year} ${v.make} ${v.model}',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    if (v.licensePlate.isNotEmpty)
                                      Text(v.licensePlate,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                  color: theme.colorScheme
                                                      .onSurfaceVariant)),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right,
                                  color: theme.colorScheme.onSurfaceVariant),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Number input page
// ─────────────────────────────────────────────────────────────

class _InputPage extends StatelessWidget {
  const _InputPage({
    required this.label,
    required this.prefix,
    required this.suffix,
    required this.value,
    required this.onDigit,
  });

  final String label;
  final String prefix;
  final String suffix;
  final String value;
  final void Function(String) onDigit;

  @override
  Widget build(BuildContext context) {
    final display = value.isEmpty ? '0' : value;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Column(
        children: [
          Text(label,
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          Expanded(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w300,
                      color: theme.colorScheme.onSurface,
                    ),
                    children: [
                      if (prefix.isNotEmpty)
                        TextSpan(
                          text: prefix,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      TextSpan(text: display),
                      if (suffix.isNotEmpty)
                        TextSpan(
                          text: suffix,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _Numpad(onDigit: onDigit),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Summary page
// ─────────────────────────────────────────────────────────────

class _SummaryPage extends StatelessWidget {
  const _SummaryPage({
    required this.odometer,
    required this.cost,
    required this.gallons,
    required this.onCancel,
    required this.onAdd,
  });

  final double odometer;
  final double cost;
  final double gallons;
  final VoidCallback onCancel;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Add Fuel Record?',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 40),
          _SummaryRow(
            icon: Icons.speed,
            label: 'Odometer',
            value: '${odometer.toStringAsFixed(0)} mi',
          ),
          const Divider(height: 24),
          _SummaryRow(
            icon: Icons.attach_money,
            label: 'Fuel Cost',
            value: '\$${cost.toStringAsFixed(2)}',
          ),
          const Divider(height: 24),
          _SummaryRow(
            icon: Icons.local_gas_station,
            label: 'Gallons Added',
            value: '${gallons.toStringAsFixed(3)} gal',
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  onPressed: onAdd,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 16),
        Text(label,
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        const Spacer(),
        Text(value,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Numpad
// ─────────────────────────────────────────────────────────────

class _Numpad extends StatelessWidget {
  const _Numpad({required this.onDigit});
  final void Function(String) onDigit;

  static const _rows = [
    ['7', '8', '9'],
    ['4', '5', '6'],
    ['1', '2', '3'],
    ['.', '0', '⌫'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _rows
          .map((row) => Row(
                children: row
                    .map((key) => Expanded(
                          child: _NumpadKey(
                            label: key,
                            onTap: () => onDigit(key),
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}

class _NumpadKey extends StatelessWidget {
  const _NumpadKey({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 58,
            child: Center(
              child: label == '⌫'
                  ? Icon(Icons.backspace_outlined,
                      color: theme.colorScheme.onSurface)
                  : Text(
                      label,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Dot breadcrumb indicator
// ─────────────────────────────────────────────────────────────

class _DotIndicator extends StatelessWidget {
  const _DotIndicator({required this.count, required this.current});
  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final inactive = Theme.of(context).colorScheme.outlineVariant;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? primary : inactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
