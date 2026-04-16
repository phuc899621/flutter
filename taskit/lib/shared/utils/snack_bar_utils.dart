import 'package:flutter/material.dart';
import 'package:taskit/shared/extension/color.dart';

class SnackBarUtils {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final color = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: isError ? color.error : color.success,
        content: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isError ? color.onError : color.onSuccess,
          ),
        ),
      ),
    );
  }
}
