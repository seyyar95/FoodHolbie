import 'package:equatable/equatable.dart';

abstract class RegisterEvents extends Equatable {
  const RegisterEvents();
}

class RegisterWait extends RegisterEvents {
  const RegisterWait();
  @override
  List<Object?> get props => [];
}

class RegisterInput extends RegisterEvents {
  final String? email, password, firstName;
  const RegisterInput({
    this.email,
    this.password,
    this.firstName,
  });

  @override
  List<Object?> get props => [email, password, firstName];
}
