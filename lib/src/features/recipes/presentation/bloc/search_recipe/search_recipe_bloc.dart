import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../../domain/entity/recipe_entity.dart';

part 'search_recipe_event.dart';
part 'search_recipe_state.dart';

class SearchRecipeBloc extends Bloc<SearchRecipeEvent, SearchRecipeState> {
  final SearchRecipeByNameUseCase _searchRecipeByNameUseCase;
  SearchRecipeBloc(this._searchRecipeByNameUseCase)
      : super(SearchRecipeInitial()) {
    on<SearchRecipeByNameInput>((event, emit) async {
      emit(SearchRecipeInProgress());
      try {
        final dataState = await _searchRecipeByNameUseCase.call(event.name!);
        if (dataState is DataSuccess) {
          emit(SearchRecipeSuccess(dataState.data));
        } else {
          emit(SearchRecipesFailed(dataState.error!));
        }
      } on DioException catch (e) {
        emit(SearchRecipesFailed(e));
      }
    });
  }
}
