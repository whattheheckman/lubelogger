import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/supply_record.dart';
import '../providers/supply_records_provider.dart';

class SupplyFormScreen extends ConsumerStatefulWidget {
  const SupplyFormScreen({super.key, required this.vehicleId, this.supplyId});
  final int vehicleId;
  final int? supplyId;

  @override
  ConsumerState<SupplyFormScreen> createState() => _SupplyFormScreenState();
}

class _SupplyFormScreenState extends ConsumerState<SupplyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  final _partNumberController = TextEditingController();
  final _quantityController = TextEditingController(text: '1.0');
  final _costController = TextEditingController(text: '0.00');
  final _notesController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _descController.dispose();
    _partNumberController.dispose();
    _quantityController.dispose();
    _costController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final record = SupplyRecord(
        id: widget.supplyId ?? 0,
        vehicleId: widget.vehicleId,
        description: _descController.text.trim(),
        partNumber: _partNumberController.text.trim(),
        quantity: double.tryParse(_quantityController.text) ?? 1.0,
        cost: double.tryParse(_costController.text) ?? 0,
        notes: _notesController.text.trim(),
        updatedAt: DateTime.now(),
      );
      await ref.read(supplyRecordsNotifierProvider.notifier).save(record);
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
            Text(widget.supplyId == null ? 'Add Supply' : 'Edit Supply'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                  labelText: 'Description', border: OutlineInputBorder()),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _partNumberController,
              decoration: const InputDecoration(
                  labelText: 'Part Number (optional)',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                        labelText: 'Quantity', border: OutlineInputBorder()),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _costController,
                    decoration: const InputDecoration(
                        labelText: 'Cost',
                        border: OutlineInputBorder(),
                        prefixText: '\$'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
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
