import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/use_case.dart';
part 'save_recipe_event.dart';
part 'save_recipe_state.dart';

abstract class Saved {
  static List<int> savedRecipes = [];
}

class SaveRecipeBloc extends Bloc<SaveRecipeEvent, SaveRecipeState> {
  final SaveRecipeUseCase _saveRecipeUseCase;
  SaveRecipeBloc(this._saveRecipeUseCase) : super(SaveRecipeInitial()) {
    on<SaveID>(
      (event, emit) async {
        emit(
          SaveRecipeLoading(),
        );
        try {
          final dataState = await _saveRecipeUseCase.call(
            event.id!,
          );
          if (dataState is DataSuccess) {
            emit(
              SaveRecipeSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              SaveRecipeFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            SaveRecipeFailed(e),
          );
        }
      },
    );
  }
}
