import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  const UserLoginEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
