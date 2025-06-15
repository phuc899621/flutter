import 'package:taskit/features/task/domain/entities/category_entity.dart';

extension CategoryEntityEnum on CategoryEntity {
  static CategoryEntity defaultCategory() =>
      const CategoryEntity(name: 'Any', localId: -1);
}
