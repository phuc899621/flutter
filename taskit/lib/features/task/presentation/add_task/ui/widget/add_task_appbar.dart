import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AddTaskAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: color.onPrimary,
                ),
              )
            : null,
        backgroundColor: color.primary,
        title: Text(
          'Add Task',
          style: text.headlineMedium,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
