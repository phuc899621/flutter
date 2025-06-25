import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_color.dart';

final textThemeProvider =
    Provider<TextTheme>((ref) => AppTextTheme().getTextThemeConfig());

class AppTextTheme {
  TextTheme getTextThemeConfig() => const TextTheme(
      headlineMedium:
          TextStyle(color: ConstColor.onPrimary, fontWeight: FontWeight.w600),
      headlineSmall:
          TextStyle(color: ConstColor.onPrimary, fontWeight: FontWeight.w600),

      //label
      labelLarge: TextStyle(fontWeight: FontWeight.w500));
}
