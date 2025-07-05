import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/features/task/presentation/category/state/category_state.dart';

final categoryControllerProvider =
    AutoDisposeNotifierProvider<CategoryController, CategoryState>(
        CategoryController.new);

class CategoryController extends AutoDisposeNotifier<CategoryState> {
  late StreamSubscription _categorySub;

  @override
  CategoryState build() {
    _listenCategory();
    return CategoryState();
  }

  void _listenCategory() {
    _categorySub = ref
        .watch(taskServiceProvider)
        .watchAllCategories()
        .listen((categories) => state = state.copyWith(categories: categories));
  }
}
