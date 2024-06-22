import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entity/recipe_entity.dart';

part 'daily_suggestion_event.dart';
part 'daily_suggestion_state.dart';

class DailySuggestionBloc
    extends Bloc<DailySuggestionEvent, DailySuggestionState> {
  final GetDailySuggestionUseCase _dailySuggestionUseCase;
  DailySuggestionBloc(this._dailySuggestionUseCase)
      : super(DailySuggestionInitial()) {
    on<DailySuggestionEvent>(
      (event, emit) async {
        emit(DailySuggestionLoading());
        try {
          final dataState = await _dailySuggestionUseCase.call();
          if (dataState is DataSuccess) {
            emit(
              DailySuggestionSuccess(dataState.data),
            );
          }
          if (dataState is DataFailed) {
            emit(
              DailySuggestionFailed(dataState.error!),
            );
          }
        } on DioException catch (e) {
          emit(
            DailySuggestionFailed(e),
          );
        }
      },
    );
  }
}
