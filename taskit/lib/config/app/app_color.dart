import 'dart:ui';

import 'package:flutter/material.dart';

class ConstColor {
  static const primary = Color(0xFF4b39ef);
  static const onPrimary = Color(0xFFFFFFFF);
  static const secondary = Color(0xFFFF6600);
  static const onSecondary=Color(0xFFFFFFFF);

  static const primaryText=Color(0xFF14181b);
  static const secondaryText=Color(0xFF57636c);

  static const alternative=Color(0xFFe0e3e7);

  static const primaryBackground = Color(0xFFf1f4f8);
  static const secondaryBackground = Color(0xFFFFFFFF);//

  static const primaryBackgroundDark = Color(0xFF121212);
  static const secondaryBackgroundDark = Color(0xFF1E1E1E);
  static const error = Color(0xFFFF5963);
  static const success=Color(0xFF4CAF50);
  static const warning=Color(0xFFFF9800);
  static const none=Color(0xFF57636c);
  static const high = Color(0xFFFF5963);
  static const low=Color(0xFF4CAF50);
  static const medium=Color(0xFFFF9800);

}
class AppColor {
  final BuildContext context;

  AppColor(this.context);

  Color get primary => Theme.of(context).colorScheme.primary;
  Color get onPrimary => Theme.of(context).colorScheme.onPrimary;
  Color get onSecondary => Theme.of(context).colorScheme.onSecondary;
  Color get primaryText => ConstColor.primaryText ?? Colors.black;
  Color get secondaryText => ConstColor.secondaryText ?? Colors.grey;
  Color get primaryContainer => Theme.of(context).colorScheme.primaryContainer;
  Color get secondaryContainer => Theme.of(context).colorScheme.secondaryContainer;
  Color get secondary => Theme.of(context).colorScheme.secondary;
  Color get background => Theme.of(context).colorScheme.background;
  Color get surface => Theme.of(context).colorScheme.surface;
  Color get error => Theme.of(context).colorScheme.error;
  Color get onBackground => Theme.of(context).colorScheme.onBackground;
  Color get onSurface => ConstColor.alternative;
  Color get onError => Theme.of(context).colorScheme.onError;
}
