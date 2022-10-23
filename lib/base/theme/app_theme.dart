import 'package:flutter/material.dart';
import 'package:riverpod_example/base/theme/font_family.dart';

class AppTheme {
  static const headLineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const headLineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const headLineSmall = TextStyle(
    fontFamily: FontFamily.roboto,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
