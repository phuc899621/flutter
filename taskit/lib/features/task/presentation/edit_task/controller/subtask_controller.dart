import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/utils/text_controller.dart';

final subtaskControllerProvider =
    Provider.autoDispose<ListTextControllerManager>(
        (ref) => ListTextControllerManager());
final titleControllerProvider = Provider.autoDispose<TextControllerManager>(
    (ref) => TextControllerManager());
