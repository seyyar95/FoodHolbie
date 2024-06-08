import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String? email;
  final String? accessToken;
  final String? refreshToken;
  const UserLoginEntity({
    this.email,
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [email, accessToken, refreshToken];
}
