import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/utils/text_controller.dart';

final categoryTextControllerProvider =
    Provider.autoDispose<ListTextControllerManager>(
        (ref) => ListTextControllerManager());
