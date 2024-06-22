part of 'daily_suggestion_bloc.dart';

sealed class DailySuggestionState extends Equatable {
  final List<RecipeEntity>? recipes;
  final DioException? error;
  const DailySuggestionState({
    this.error,
    this.recipes,
  });
}

final class DailySuggestionInitial extends DailySuggestionState {
  @override
  List<Object?> get props => [];
}

class DailySuggestionLoading extends DailySuggestionState {
  @override
  List<Object> get props => [];
}

class DailySuggestionSuccess extends DailySuggestionState {
  const DailySuggestionSuccess(List<RecipeEntity> recipe)
      : super(recipes: recipe);

  @override
  List<Object> get props => [recipes!];
}

class DailySuggestionFailed extends DailySuggestionState {
  const DailySuggestionFailed(DioException? error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
