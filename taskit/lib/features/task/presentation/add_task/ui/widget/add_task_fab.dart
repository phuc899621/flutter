import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskFab extends ConsumerWidget {
  final VoidCallback? onPressed;

  const AddTaskFab({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color.primary,
          foregroundColor: color.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Add',
            style: text.labelLarge?.copyWith(
                color: color.onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
