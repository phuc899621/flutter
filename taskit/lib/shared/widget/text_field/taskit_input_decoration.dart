import 'package:flutter/material.dart';

class TaskitInputDecoration {
  TaskitInputDecoration._();

  static InputDecoration outlined({
    required ColorScheme color,
    required TextTheme text,
    String? labelText,
    String? errorText,
    Widget? suffixIcon,
    bool isDense = false,
    EdgeInsetsGeometry? contentPadding,
  }) => InputDecoration(
    labelText: labelText,
    labelStyle: text.bodySmall?.copyWith(color: color.onSurfaceVariant),
    errorText: errorText,
    suffixIcon: suffixIcon,
    isDense: isDense,
    contentPadding: contentPadding,
    filled: true,
    fillColor: color.surfaceContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.primary, width: 2.0),
      borderRadius: BorderRadius.circular(20.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.error, width: 2.0),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.primary, width: 2.0),
      borderRadius: BorderRadius.circular(20.0),
    ),
  );

  static InputDecoration code({
    required ColorScheme color,
    required TextTheme text,
  }) => InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 20),
    labelStyle: text.labelMedium,
    hintStyle: text.labelMedium,
    filled: true,
    fillColor: color.surfaceContainer,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.surfaceContainerHighest, width: 1.0),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.primary, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.error, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.primary, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
