import 'package:floor/floor.dart';

@Entity(tableName: 'category')
class CategoryModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  CategoryModel({required this.name, this.id});
}
