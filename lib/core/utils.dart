import 'dart:ui';

/// Parses a hex color string (e.g. "0097DB" or "#0097DB") into a [Color].
///
/// Accepts optional leading `#`, and 6-digit (RGB) or 8-digit (ARGB) values.
/// Falls back to fully opaque black when the value cannot be parsed.
Color colorFromHex(String hex) {
  String cleaned = hex.replaceAll('#', '').trim();
  if (cleaned.length == 6) {
    cleaned = 'FF$cleaned';
  }
  final int? value = int.tryParse(cleaned, radix: 16);
  return Color(value ?? 0xFF000000);
}
