import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskitButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const TaskitButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? color.primary,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: foregroundColor ?? color.onPrimary),
      ),
    );
  }
}

class TaskitBackButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const TaskitBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: color.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        iconSize: 50,
        icon: Icon(Icons.arrow_back, color: color.onPrimary, size: 24.0),
        onPressed: onPressed,
      ),
    );
  }
}
