import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/local_vehicle_repository.dart';
import '../domain/vehicle.dart';
import '../providers/vehicles_provider.dart';

class VehicleFormScreen extends ConsumerStatefulWidget {
  const VehicleFormScreen({super.key, this.vehicleId});
  final int? vehicleId;

  @override
  ConsumerState<VehicleFormScreen> createState() => _VehicleFormScreenState();
}

class _VehicleFormScreenState extends ConsumerState<VehicleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _yearController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _plateController = TextEditingController();
  bool _isElectric = false;
  bool _isDiesel = false;
  bool _isLoading = false;
  Vehicle? _existing;

  @override
  void initState() {
    super.initState();
    if (widget.vehicleId != null) {
      Future.microtask(_loadExisting);
    }
  }

  Future<void> _loadExisting() async {
    final vehicle = await ref
        .read(localVehicleRepositoryProvider)
        .getById(widget.vehicleId!);
    if (vehicle == null || !mounted) return;
    setState(() {
      _existing = vehicle;
      _yearController.text = vehicle.year;
      _makeController.text = vehicle.make;
      _modelController.text = vehicle.model;
      _plateController.text = vehicle.licensePlate;
      _isElectric = vehicle.isElectric;
      _isDiesel = vehicle.isDiesel;
    });
  }

  @override
  void dispose() {
    _yearController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _plateController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final notifier = ref.read(vehiclesNotifierProvider.notifier);
      final vehicle = _existing?.copyWith(
            year: _yearController.text.trim(),
            make: _makeController.text.trim(),
            model: _modelController.text.trim(),
            licensePlate: _plateController.text.trim(),
            isElectric: _isElectric,
            isDiesel: _isDiesel,
            updatedAt: DateTime.now(),
          ) ??
          Vehicle(
            id: 0,
            year: _yearController.text.trim(),
            make: _makeController.text.trim(),
            model: _modelController.text.trim(),
            licensePlate: _plateController.text.trim(),
            isElectric: _isElectric,
            isDiesel: _isDiesel,
            updatedAt: DateTime.now(),
          );
      if (widget.vehicleId == null) {
        await notifier.addVehicle(vehicle);
      } else {
        await notifier.updateVehicle(vehicle);
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
        title: Text(widget.vehicleId == null ? 'Add Vehicle' : 'Edit Vehicle'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(labelText: 'Year'),
              keyboardType: TextInputType.number,
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _makeController,
              decoration: const InputDecoration(labelText: 'Make'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _modelController,
              decoration: const InputDecoration(labelText: 'Model'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _plateController,
              decoration: const InputDecoration(labelText: 'License Plate'),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Electric'),
              value: _isElectric,
              onChanged: (v) => setState(() => _isElectric = v),
            ),
            SwitchListTile(
              title: const Text('Diesel'),
              value: _isDiesel,
              onChanged: (v) => setState(() => _isDiesel = v),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
