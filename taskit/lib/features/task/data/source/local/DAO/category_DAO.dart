import 'package:floor/floor.dart';
import 'package:taskit/features/task/data/model/category.dart';

@dao
abstract class CategoryDAO {
  @Insert()
  Future<void> insert(CategoryModel category);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<CategoryModel> categories);
  @Query('SELECT * FROM categories')
  Future<List<CategoryModel>> getAllCategories();
}
