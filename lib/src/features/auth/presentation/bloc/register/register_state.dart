import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  RegisterSuccess();

  @override
  List<Object?> get props => [];
}

class RegisterFailed extends RegisterState {
  @override
  List<Object?> get props => [];
}
