import 'package:foodmania/src/features/auth/domain/entity/user_register_entity.dart';

class UserRegisterModel extends UserRegisterEntity {
  const UserRegisterModel({
    String? id,
    String? email,
    String? firstName,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
    );
  }
}
