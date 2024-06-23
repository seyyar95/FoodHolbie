part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  final ProfileEntity? profile;
  final DioException? error;
  const ProfileState({this.profile, this.error});
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  const ProfileSuccess(ProfileEntity profile) : super(profile: profile);

  @override
  List<Object> get props => [profile!];
}

class ProfileFailed extends ProfileState {
  const ProfileFailed(DioException? error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
