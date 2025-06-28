import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          foregroundColor: color.onPrimaryContainer,
          splashColor: color.primary,
          backgroundColor: color.primaryContainer,
          child: Icon(
            Icons.add_sharp,
            size: 30,
          ),
          onPressed: () => context.push('/add_task')),
      appBar: AppBar(
        title: const Text('Calendar'),
        titleTextStyle: text.headlineSmall,
      ),
    );
  }
}
