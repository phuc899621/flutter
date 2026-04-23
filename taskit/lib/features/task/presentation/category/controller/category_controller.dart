import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/features/task/presentation/category/state/category_state.dart';

import '../../../../auth/presentation/auth/controller/auth_controller.dart';

final categoryControllerProvider =
    NotifierProvider.autoDispose<CategoryController, CategoryState>(
      CategoryController.new,
    );

class CategoryController extends Notifier<CategoryState> {
  late StreamSubscription _categorySub;
  late final ProviderSubscription _authSub;

  @override
  CategoryState build() {
    _authSub = ref.listen(
      authControllerProvider.select((value) => value.user),
      (_, next) {
        if (next == null) {
          _categorySub.cancel();
        } else {
          _listenCategory(next.localId);
        }
      },
    );

    ref.onDispose(() {
      _authSub.close();
      _categorySub.cancel();
    });
    return CategoryState();
  }

  void _listenCategory(int userLocalId) {
    _categorySub = ref
        .watch(taskServiceProvider)
        .watchAllCategories(userLocalId)
        .listen((categories) => state = state.copyWith(categories: categories));
  }
}
