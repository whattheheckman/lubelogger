import 'package:flutter/services.dart';

/// Restricts input to digits only (no decimal point).
final digitsOnlyFormatter = FilteringTextInputFormatter.digitsOnly;

/// Restricts input to digits and at most one decimal point.
final decimalOnlyFormatter = FilteringTextInputFormatter.allow(
  RegExp(r'[0-9.]'),
);

/// Cash-register style currency formatter.
/// Digits accumulate from the right:
///   type "1" → "0.01"
///   type "5" → "0.15"
///   type "3" → "1.53"
/// Backspace removes the rightmost digit.
class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) {
      return newValue.copyWith(
        text: '0.00',
        selection: const TextSelection.collapsed(offset: 4),
      );
    }
    final cents = int.tryParse(digits) ?? 0;
    final dollars = cents ~/ 100;
    final remainingCents = cents % 100;
    final formatted = '$dollars.${remainingCents.toString().padLeft(2, '0')}';
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
