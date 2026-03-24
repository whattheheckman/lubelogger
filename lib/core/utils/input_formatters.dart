import 'package:flutter/services.dart';

/// Restricts input to digits only (no decimal point).
final digitsOnlyFormatter = FilteringTextInputFormatter.digitsOnly;

/// Restricts input to digits and at most one decimal point.
final decimalOnlyFormatter = FilteringTextInputFormatter.allow(
  RegExp(r'[0-9.]'),
);

/// Right-to-left decimal formatter. Digits accumulate from the right so the
/// decimal point stays fixed — like a cash register or fuel pump display.
///
/// [decimalPlaces] controls how many fractional digits are shown (default 2).
///
/// Examples with decimalPlaces = 2 (currency):
///   type "1" → "0.01", type "5" → "0.15", type "3" → "1.53"
///
/// Examples with decimalPlaces = 3 (gallons):
///   type "1" → "0.001", type "5" → "0.015", type "3" → "0.153"
class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.decimalPlaces = 2});

  final int decimalPlaces;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final scale = _pow10(decimalPlaces);
    if (digits.isEmpty) {
      return newValue.copyWith(
        text: '',
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
    final value = int.tryParse(digits) ?? 0;
    final whole = value ~/ scale;
    final fraction = (value % scale).toString().padLeft(decimalPlaces, '0');
    final formatted = '$whole.$fraction';
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  static int _pow10(int exp) {
    var result = 1;
    for (var i = 0; i < exp; i++) { result *= 10; }
    return result;
  }
}
