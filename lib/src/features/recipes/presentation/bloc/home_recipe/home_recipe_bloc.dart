import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe/home_recipe_event.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe/home_recipe_state.dart';

class HomeRecipeBloc extends Bloc<HomeRecipeEvents, HomeRecipeState> {
  final HomeSearchRecipeUseCase _homeSearchRecipeUseCase;
  HomeRecipeBloc(this._homeSearchRecipeUseCase) : super(HomeRecipeInitial()) {
    on<HomeRecipeInput>(
      (event, emit) async {
        emit(
          HomeRecipeLoading(),
        );
        try {
          final dataState = await _homeSearchRecipeUseCase.call(
            event.ingredients!,
          );
          if (dataState is DataSuccess) {
            emit(
              HomeRecipeSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              HomeRecipeFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            HomeRecipeFailed(e),
          );
        }
      },
    );
  }
}
