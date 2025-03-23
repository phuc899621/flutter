import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? imageUrl;
  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.password,
    this.imageUrl,
});
  @override
  List<Object?> get props {
    return [id, name, email, password, imageUrl];
  }
}