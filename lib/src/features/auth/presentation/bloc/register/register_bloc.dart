import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/auth/domain/usecase/register_usecase.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/Register/Register_events.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  final RegisterUseCaseImpl _registerUseCase;
  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<RegisterInput>((event, emit) async {
      emit(RegisterLoading());
      final dataState = await _registerUseCase.call(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
      );

      if (dataState is DataSuccess) {
        emit(RegisterSuccess());
      }
      if (dataState is DataFailed) {
        emit(RegisterFailed());
      }
    });
  }
}
