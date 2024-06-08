import '../../domain/entity/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  const UserLoginModel({
    super.email,
    super.accessToken,
    super.refreshToken,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      email: json["email"] ?? "",
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
    );
  }
}
