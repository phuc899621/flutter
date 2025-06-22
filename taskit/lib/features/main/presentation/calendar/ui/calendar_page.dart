import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app/app_color.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = ref.read(colorProvider(context));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        titleTextStyle: text.headlineSmall,
      ),
    );
  }
}
