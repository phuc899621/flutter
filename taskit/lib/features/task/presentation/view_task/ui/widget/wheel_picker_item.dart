import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WheelPickerItem extends ConsumerWidget {
  final String text;

  const WheelPickerItem({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        child: Center(
          child: Text(
            text,
            style: textStyle.titleMedium?.copyWith(
                color: color.onSurfaceVariant, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
