import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entity/user_login_entity.dart';

abstract class LoginState extends Equatable {
  final UserLoginEntity? user;
  final DioException? error;
  const LoginState({
    this.error,
    this.user,
  });
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  const LoginSuccess(UserLoginEntity user) : super(user: user);

  @override
  List<Object> get props => [user!];
}

class LoginFailed extends LoginState {
  const LoginFailed(DioException error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
