import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/config/app/text_theme.dart';

import 'app_color.dart';

final themeProvider = Provider<ThemeData>((ref) => ThemeData(
      fontFamily: 'Quicksand',
//primary
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.surface,
      textTheme: ref.watch(textThemeProvider),
//text
      colorScheme: const ColorScheme.light(
        primary: AppColor.primary,
        onPrimary: AppColor.onPrimary,
        primaryContainer: AppColor.primaryContainer,
        onPrimaryContainer: AppColor.onPrimaryContainer,
        secondary: AppColor.secondary,
        onSecondary: AppColor.onSecondary,
        secondaryContainer: AppColor.secondaryContainer,
        onSecondaryContainer: AppColor.onSecondaryContainer,
        tertiary: AppColor.tertiary,
        onTertiary: AppColor.onTertiary,
        tertiaryContainer: AppColor.tertiaryContainer,
        onTertiaryContainer: AppColor.onTertiaryContainer,
        surface: AppColor.surface,
        surfaceDim: AppColor.surfaceDim,
        surfaceContainer: AppColor.surfaceContainer,
        surfaceContainerHighest: AppColor.surfaceContainerHighest,
        surfaceContainerHigh: AppColor.surfaceContainerHigh,
        onSurface: AppColor.primaryText,
        onSurfaceVariant: AppColor.secondaryText,
        outline: AppColor.outline,
        outlineVariant: AppColor.outlineVariant,
        error: AppColor.error,
        onError: AppColor.onError,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.onPrimary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.surfaceContainer,
          selectedItemColor: AppColor.primaryContainer,
          unselectedItemColor: AppColor.surfaceContainer,
          selectedIconTheme: IconThemeData(
            color: AppColor.onPrimaryContainer,
          ),
          unselectedIconTheme: IconThemeData(
            color: AppColor.onSurfaceVariant,
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryContainer,
        foregroundColor: AppColor.onPrimaryContainer,
      ),
    ));
