import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_color.dart';

final textStyleProvider =
    Provider.family<AppTextStyle, BuildContext>((ref, context) {
  return AppTextStyle(context);
});
final textThemeProvider =
    Provider<TextTheme>((ref) => AppTextTheme().getTextThemeConfig());

class AppTextTheme {
  TextTheme getTextThemeConfig() => const TextTheme(
      headlineMedium:
          TextStyle(color: ConstColor.onPrimary, fontWeight: FontWeight.w600));
}

class AppTextStyle {
  final BuildContext context;
  AppTextStyle(this.context);
  TextStyle? get headlineMedium => Theme.of(context).textTheme.headlineMedium;
  TextStyle? get titleMedium => Theme.of(context).textTheme.titleMedium;
  TextStyle? get titleLarge => Theme.of(context).textTheme.titleLarge;
  TextStyle? get bodyMedium => Theme.of(context).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(context).textTheme.bodyLarge;
  TextStyle? get labelMedium => Theme.of(context).textTheme.labelMedium;
  TextStyle? get headlineSmall => Theme.of(context).textTheme.headlineSmall;
  TextStyle? get titleSmall => Theme.of(context).textTheme.titleSmall;
  TextStyle? get labelSmall => Theme.of(context).textTheme.labelSmall;
}
