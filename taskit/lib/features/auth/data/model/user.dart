import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class UserModel {
  @PrimaryKey(autoGenerate: false)
  final String id;
  final String name;
  final String email;
  final String avatar;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });
}
