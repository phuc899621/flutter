import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/features/category/domain/usecases/watch_categories_usecase.dart';
import 'package:taskit/features/category/domain/usecases/watch_categories_with_task_count_usecase.dart';

final categoriesProvider = StreamProvider.autoDispose<List<CategoryEntity>>((
  ref,
) {
  final authState = ref.watch(authControllerProvider);
  final user = authState.user;

  if (user == null) return Stream.value([]);

  return ref.watch(watchCategoriesUseCaseProvider).call(user.localId);
});

final categoriesWithTaskCountProvider =
    StreamProvider.autoDispose<List<CategoryEntity>>((ref) {
      final authState = ref.watch(authControllerProvider);
      final user = authState.user;

      if (user == null) return Stream.value([]);

      return ref
          .watch(watchCategoriesWithTaskCountUseCaseProvider)
          .call(user.localId);
    });
