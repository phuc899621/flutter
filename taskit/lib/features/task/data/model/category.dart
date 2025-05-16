import 'package:floor/floor.dart';

@Entity(tableName: 'category')
class CategoryModel {
  final String? name;
  CategoryModel(this.name);
}
