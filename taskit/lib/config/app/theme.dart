import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/config/app/text_theme.dart';

import 'app_color.dart';

final themeProvider = Provider<ThemeData>((ref) => ThemeData(
      fontFamily: 'Quicksand',
//primary
      primaryColor: ConstColor.primary,
      scaffoldBackgroundColor: ConstColor.surface,
      textTheme: ref.watch(textThemeProvider),
//text
      colorScheme: const ColorScheme.light(
        primary: ConstColor.primary,
        onPrimary: ConstColor.onPrimary,
        primaryContainer: ConstColor.primaryContainer,
        onPrimaryContainer: ConstColor.onPrimaryContainer,
        secondary: ConstColor.secondary,
        onSecondary: ConstColor.onSecondary,
        secondaryContainer: ConstColor.secondaryContainer,
        onSecondaryContainer: ConstColor.onSecondaryContainer,
        tertiary: ConstColor.tertiary,
        onTertiary: ConstColor.onTertiary,
        tertiaryContainer: ConstColor.tertiaryContainer,
        onTertiaryContainer: ConstColor.onTertiaryContainer,
        surface: ConstColor.surface,
        surfaceDim: ConstColor.surfaceDim,
        surfaceContainer: ConstColor.surfaceContainer,
        surfaceContainerHighest: ConstColor.surfaceContainerHighest,
        surfaceContainerHigh: ConstColor.surfaceContainerHigh,
        onSurface: ConstColor.primaryText,
        onSurfaceVariant: ConstColor.secondaryText,
        outline: ConstColor.outline,
        outlineVariant: ConstColor.outlineVariant,
        error: ConstColor.error,
        onError: ConstColor.onError,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ConstColor.primary,
        foregroundColor: ConstColor.onPrimary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ConstColor.surfaceContainer,
          selectedItemColor: ConstColor.primaryContainer,
          unselectedItemColor: ConstColor.surfaceContainer,
          selectedIconTheme: IconThemeData(
            color: ConstColor.onPrimaryContainer,
          ),
          unselectedIconTheme: IconThemeData(
            color: ConstColor.onSurfaceVariant,
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ConstColor.primaryContainer,
        foregroundColor: ConstColor.onPrimaryContainer,
      ),
    ));
