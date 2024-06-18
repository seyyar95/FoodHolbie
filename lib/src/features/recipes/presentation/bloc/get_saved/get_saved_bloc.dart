import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entity/recipe_entity.dart';

part 'get_saved_event.dart';
part 'get_saved_state.dart';

class GetSavedBloc extends Bloc<GetSavedEvent, GetSavedState> {
  final GetSavedRecipeUseCase _recipeUseCase;
  GetSavedBloc(this._recipeUseCase) : super(GetSavedInitial()) {
    on<GetSavedEvent>(
      (event, emit) async {
        emit(
          GetSavedLoading(),
        );
        try {
          final dataState = await _recipeUseCase.call();
          if (dataState is DataSuccess) {
            emit(
              GetSavedSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              GetSavedFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            GetSavedFailed(e),
          );
        }
      },
    );
  }
}
