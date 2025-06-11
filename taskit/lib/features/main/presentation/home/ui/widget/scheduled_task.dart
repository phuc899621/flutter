import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';

class ScheduledTaskItem extends ConsumerWidget {
  final TaskEntity task;

  const ScheduledTaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
