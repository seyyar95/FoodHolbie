part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetUserData extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserData extends ProfileEvent {
  final Map<String, dynamic>? body;
  const UpdateUserData(this.body);

  @override
  List<Object?> get props => [body];
}
