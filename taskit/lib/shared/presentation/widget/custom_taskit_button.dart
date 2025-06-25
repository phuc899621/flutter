import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskitElevationButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;

  const TaskitElevationButton(
      {super.key, this.text = "", required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
        backgroundColor: color.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(text,
          style: textStyle.titleMedium?.copyWith(color: color.onPrimary)),
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
        icon: Icon(
          Icons.arrow_back,
          color: color.onPrimary,
          size: 24.0,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
