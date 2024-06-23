import 'package:foodmania/src/features/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    super.name,
    super.email,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
    );
  }
}
