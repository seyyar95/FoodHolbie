import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../../../../../core/resources/data_state.dart';

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final RecipeDetailUseCase _recipeDetailUseCase;
  RecipeDetailBloc(this._recipeDetailUseCase) : super(RecipeDetailInitial()) {
    on<RecipeDetail>(
      (event, emit) async {
        emit(
          RecipeDetailLoading(),
        );
        try {
          final dataState = await _recipeDetailUseCase.call(
            event.id!,
          );
          if (dataState is DataSuccess) {
            emit(
              RecipeDetailSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              RecipeDetailFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            RecipeDetailFailed(e),
          );
        }
      },
    );
  }
}
