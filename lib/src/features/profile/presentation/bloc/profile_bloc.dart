import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/profile/domain/entity/profile_entity.dart';

import '../../../../core/resources/data_state.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserDataUseCase _useCase;
  final UpdateUserDataUseCase _updateUserDataUseCase;
  ProfileBloc(this._useCase, this._updateUserDataUseCase)
      : super(ProfileInitial()) {
    on<ProfileEvent>(
      (event, emit) async {
        emit(ProfileLoading());
        try {
          final dataState = await _useCase.call();
          if (dataState is DataSuccess) {
            emit(
              ProfileSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              ProfileFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            ProfileFailed(e),
          );
        }
      },
    );
    on<UpdateUserData>(
      (event, emit) async {
        emit(ProfileLoading());
        try {
          final dataState = await _updateUserDataUseCase.call(event.body!);
          if (dataState is DataSuccess) {
            emit(
              ProfileSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              ProfileFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            ProfileFailed(e),
          );
        }
      },
    );
  }
}
