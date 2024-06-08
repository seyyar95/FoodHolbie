import 'package:equatable/equatable.dart';

class UserRegisterEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  const UserRegisterEntity({
    this.id,
    this.email,
    this.firstName,
  });

  @override
  List<Object?> get props => [id, email, firstName];
}
