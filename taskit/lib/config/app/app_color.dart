import 'package:flutter/material.dart';

class ConstColor {
  static const primary = Color(0xff00809d);
  static const onPrimary = Color(0xFFFCECDD);
  static const secondary = Color(0xFFFF7601);
  static const secondaryLight = Color(0xFFF3A26D);
  static const onSecondary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xff6baacc);

  static const primaryText = Color(0xFF14181b);
  static const secondaryText = Color(0xFF57636c);

  static const alternative = Color(0xFFe0e3e7);

  static const primaryBackground = Color(0xFFf1f4f8);
  static const secondaryBackground = Color(0xFFFFFFFF); //

  static const primaryBackgroundDark = Color(0xFF121212);
  static const secondaryBackgroundDark = Color(0xFF1E1E1E);
  static const error = Color(0xFFFC0E1C);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const none = Color(0xFF57636c);
  static const high = Color(0xFFFF5963);
  static const low = Color(0xFF4CAF50);
  static const medium = Color(0xFFFF9800);
  static const errorLight = Color(0xFFE56D5B);
  static const tertiary = Color(0xff809d3c);
  static const tertiaryLight = Color(0xffa9c46c);
  static const tertiaryAccent = Color(0xff5d8736);
  static const onTertiary = Color(0xfff4ffc3);
}

class AppColor {
  final BuildContext context;

  AppColor(this.context);

  Color get primary => Theme.of(context).colorScheme.primary;
  Color get onPrimary => Theme.of(context).colorScheme.onPrimary;
  Color get onSecondary => Theme.of(context).colorScheme.onSecondary;
  Color get secondaryLight => ConstColor.secondaryLight;
  Color get primaryText => ConstColor.primaryText ?? Colors.black;
  Color get secondaryText => ConstColor.secondaryText ?? Colors.grey;
  Color get primaryContainer => Theme.of(context).colorScheme.primaryContainer;
  Color get secondaryContainer =>
      Theme.of(context).colorScheme.secondaryContainer;
  Color get secondary => Theme.of(context).colorScheme.secondary;
  Color get background => Theme.of(context).colorScheme.surface;
  Color get surface => Theme.of(context).colorScheme.surface;
  Color get error => Theme.of(context).colorScheme.error;
  Color get onBackground => Theme.of(context).colorScheme.onSurface;
  Color get onSurface => ConstColor.alternative;
  Color get onError => Theme.of(context).colorScheme.onError;
  Color get errorLight => ConstColor.errorLight;
  Color get medium => ConstColor.medium;
  Color get primaryBackground => ConstColor.primaryBackground;
  Color get secondaryBackground => ConstColor.secondaryBackground;
  Color get tertiary => ConstColor.tertiary;
  Color get tertiaryLight => ConstColor.tertiaryLight;
  Color get tertiaryAccent => ConstColor.tertiaryAccent;
  Color get onTertiary => ConstColor.onTertiary;
}
