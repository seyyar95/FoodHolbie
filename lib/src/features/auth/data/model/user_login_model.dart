import '../../domain/entity/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  const UserLoginModel({
    super.accessToken,
    super.refreshToken,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      accessToken: json['access'] ?? '',
      refreshToken: json['refresh'] ?? '',
    );
  }
}
