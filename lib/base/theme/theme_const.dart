import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'font_family.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: FontFamily.roboto,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headlineLarge: AppTheme.headLineLarge,
    headlineMedium: AppTheme.headLineMedium,
    headlineSmall: AppTheme.headLineSmall,
    titleLarge: AppTheme.titleLarge,
    titleMedium: AppTheme.titleMedium,
    titleSmall: AppTheme.titleSmall,
    bodyLarge: AppTheme.bodyLarge,
    bodyMedium: AppTheme.bodyMedium,
    bodySmall: AppTheme.bodySmall,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: FontFamily.roboto,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    headlineLarge: AppTheme.headLineLarge,
    headlineMedium: AppTheme.headLineMedium,
    headlineSmall:  AppTheme.headLineSmall,
    titleLarge: AppTheme.titleLarge,
    titleMedium: AppTheme.titleMedium,
    titleSmall: AppTheme.titleSmall,
    bodyLarge: AppTheme.bodyLarge,
    bodyMedium: AppTheme.bodyMedium,
    bodySmall: AppTheme.bodySmall,
  ),
);
