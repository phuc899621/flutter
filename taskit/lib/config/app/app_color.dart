import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/extension/color.dart';

class ConstColor {
  static const primary = Color(0xff00809d);
  static const onPrimary = Colors.white;
  static const primaryContainer = Color(0xFFC9E6FF);
  static const onPrimaryContainer = Color(0xFF001D36);

  static const secondary = Color(0xFFFFAB40);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFFFDCBD);
  static const onSecondaryContainer = Color(0xFF2C1600);

  static const tertiary = Color(0xFF7CB342);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFFC5E1A5);
  static const onTertiaryContainer = Color(0xFF102004);

  static const scheduledContainer = Color(0xFFBBDEFB);
  static const onScheduledContainer = Color(0xFF0D47A1);

  static const pendingContainer = Color(0xFFFFCC80);
  static const onPendingContainer = Color(0xFFE65100);

  static const completedContainer = Color(0xFFC8E6C9);
  static const onCompletedContainer = Color(0xFF1B5E20);

  static const highContainer = Color(0xFFEF9A9A);
  static const onHighContainer = Color(0xFFB71C1C);

  static const mediumContainer = Color(0xFFFADF8B);
  static const onMediumContainer = Color(0xFF7C4811);

  static const lowContainer = Color(0xFFA5D6A7);
  static const onLowContainer = Color(0xFF2E7D32);

  static const noneContainer = Color(0xFFB0BEC5);
  static const onNoneContainer = Color(0xFF37474F);

  static const primaryText = Color(0xFF14181b);
  static const secondaryText = Color(0xFF57636c);

  //background
  static const surface = Color(0xFFF7F9FE);
  static const surfaceDim = Color(0xFFDED8E0);

  //card
  static const surfaceContainer = Color(0xFFEBEEF3);
  static const surfaceContainerHighest = Color(0xFFDFE3E8);
  static const surfaceContainerHigh = Color(0xFFE5E8ED);
  static const surfaceContainerLow = Color(0xFFF1F4F9);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);

  //text
  static const onSurface = Color(0xFF1D1B20);
  static const onSurfaceVariant = Color(0xFF49454E);

  static const success = Color(0xFF81C784);
  static const onSuccess = Color(0xFF1B5E20);

  static const error = Color(0xFFEF9A9A);
  static const onError = Color(0xFFB71C1C);

  static const warning = Color(0xFFFFE082);
  static const onWarning = Color(0xFFEF6C00);

  static const outline = Color(0xff7a757f);
  static const outlineVariant = Color(0xFFCAC4CF);
}

final colorProvider = Provider.family<AppColor, BuildContext>((ref, context) {
  return AppColor(context);
});

class AppColor {
  final BuildContext context;

  AppColor(this.context);

  Color get primary => Theme.of(context).primaryColor;

  Color get onPrimary => Theme.of(context).colorScheme.onPrimary;

  Color get primaryContainer => Theme.of(context).colorScheme.primaryContainer;

  Color get onPrimaryContainer =>
      Theme.of(context).colorScheme.onPrimaryContainer;

  Color get secondary => Theme.of(context).colorScheme.secondary;

  Color get onSecondary => Theme.of(context).colorScheme.onSecondary;

  Color get secondaryContainer =>
      Theme.of(context).colorScheme.secondaryContainer;

  Color get onSecondaryContainer =>
      Theme.of(context).colorScheme.onSecondaryContainer;

  Color get tertiary => Theme.of(context).colorScheme.tertiary;

  Color get onTertiary => Theme.of(context).colorScheme.onTertiary;

  Color get tertiaryContainer =>
      Theme.of(context).colorScheme.tertiaryContainer;

  Color get onTertiaryContainer =>
      Theme.of(context).colorScheme.onTertiaryContainer;

  Color get scheduledContainer =>
      Theme.of(context).colorScheme.scheduledContainer;

  Color get onScheduledContainer =>
      Theme.of(context).colorScheme.onScheduledContainer;

  Color get pendingContainer => Theme.of(context).colorScheme.pendingContainer;

  Color get onPendingContainer =>
      Theme.of(context).colorScheme.onPendingContainer;

  Color get completedContainer =>
      Theme.of(context).colorScheme.completedContainer;

  Color get onCompletedContainer =>
      Theme.of(context).colorScheme.onCompletedContainer;

  Color get highContainer => Theme.of(context).colorScheme.highContainer;

  Color get onHighContainer => Theme.of(context).colorScheme.onHighContainer;

  Color get mediumContainer => Theme.of(context).colorScheme.mediumContainer;

  Color get onMediumContainer =>
      Theme.of(context).colorScheme.onMediumContainer;

  Color get lowContainer => Theme.of(context).colorScheme.lowContainer;

  Color get onLowContainer => Theme.of(context).colorScheme.onLowContainer;

  Color get noneContainer => Theme.of(context).colorScheme.noneContainer;

  Color get onNoneContainer => Theme.of(context).colorScheme.onNoneContainer;

  Color get surface => Theme.of(context).colorScheme.surface;

  Color get surfaceContainer => Theme.of(context).colorScheme.surfaceContainer;

  Color get surfaceContainerHighest =>
      Theme.of(context).colorScheme.surfaceContainerHighest;

  Color get surfaceContainerHigh =>
      Theme.of(context).colorScheme.surfaceContainerHigh;

  Color get surfaceDim => Theme.of(context).colorScheme.surfaceDim;

  Color get onSurface => Theme.of(context).colorScheme.onSurface;

  Color get onSurfaceVariant => Theme.of(context).colorScheme.onSurfaceVariant;

  Color get success => Theme.of(context).colorScheme.success;

  Color get onSuccess => Theme.of(context).colorScheme.onSuccess;

  Color get error => Theme.of(context).colorScheme.error;

  Color get onError => Theme.of(context).colorScheme.onError;

  Color get warning => Theme.of(context).colorScheme.warning;

  Color get onWarning => Theme.of(context).colorScheme.onWarning;

  Color get outline => Theme.of(context).colorScheme.outline;

  Color get outlineVariant => Theme.of(context).colorScheme.outlineVariant;

  Color get transprent => Colors.transparent;
}
