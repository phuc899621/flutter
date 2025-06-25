import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/edit_task/controller/subtask_controller.dart';

final searchControllerProvider = Provider.autoDispose<TextControllerManager>(
    (ref) => TextControllerManager());
