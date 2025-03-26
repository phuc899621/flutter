import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  const UserModel({
    String? id,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ?? "",
    name: json['name'] ?? "",
    email: json['email'] ?? "",
    password: json['password'] ?? "",
    imageUrl: json['image_url'] ?? "",
  );
}