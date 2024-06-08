import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
}

class LoginWait extends LoginEvents {
  const LoginWait();
  @override
  List<Object?> get props => [];
}
class LoginInput extends LoginEvents {
  final String? email, password;
  const LoginInput({this.email, this.password});
  
  @override
  List<Object?> get props => [email, password];
}
