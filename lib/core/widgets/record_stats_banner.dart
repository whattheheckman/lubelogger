import 'package:flutter/material.dart';

class RecordStatsBanner extends StatelessWidget {
  const RecordStatsBanner({super.key, required this.count, this.totalCost});
  final int count;
  final double? totalCost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: totalCost != null
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          _StatChip(count.toString(), 'Records'),
          if (totalCost != null)
            _StatChip('\$${totalCost!.toStringAsFixed(2)}', 'Total Cost'),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.value, this.label);
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
