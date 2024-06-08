import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/auth/domain/usecase/login_usecase.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/login/login_events.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/login/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final LoginUseCaseImpl _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<LoginInput>((event, emit) async {
      emit(LoginLoading());
      final dataState = await _loginUseCase.call(
        event.email!,
        event.password!,
      );
      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoginSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(LoginFailed(dataState.error!));
      }
    });
  }
}
