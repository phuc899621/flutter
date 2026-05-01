import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/presentation/category/state/category_state.dart';

final categoryControllerProvider =
    NotifierProvider.autoDispose<CategoryController, CategoryState>(
      CategoryController.new,
    );

class CategoryController extends Notifier<CategoryState> {
  @override
  CategoryState build() {
    return CategoryState();
  }
}
