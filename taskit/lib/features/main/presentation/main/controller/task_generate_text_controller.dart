import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/utils/text_controller.dart';

final taskGenerateTextController = Provider.autoDispose<TextControllerManager>(
    (ref) => TextControllerManager());
