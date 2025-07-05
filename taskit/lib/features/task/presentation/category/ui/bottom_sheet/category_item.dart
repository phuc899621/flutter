import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryItem extends ConsumerWidget {
  final VoidCallback onDelete;
  final String text;

  const CategoryItem({super.key, required this.onDelete, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: color.surfaceContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(mainAxisSize: MainAxisSize.max, spacing: 15, children: [
          Text(
            text,
            style: textStyle.titleMedium?.copyWith(color: color.onSurface),
          ),
          IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete_forever,
                color: color.onError,
              ))
        ]));
  }
}
