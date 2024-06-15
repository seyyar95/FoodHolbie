part of 'search_recipe_bloc.dart';

abstract class SearchRecipeState extends Equatable {
  final List<RecipeEntity>? recipes;
  final DioException? error;
  const SearchRecipeState({this.recipes, this.error});
}

class SearchRecipeInitial extends SearchRecipeState {
  @override
  List<Object?> get props => [];
}

class SearchRecipeInProgress extends SearchRecipeState {
  @override
  List<Object?> get props => [];
}

class SearchRecipeSuccess extends SearchRecipeState {
  const SearchRecipeSuccess(List<RecipeEntity> recipes) : super(recipes: recipes);

  @override
  List<Object?> get props => [recipes!];
}

class SearchRecipesFailed extends SearchRecipeState {
  const SearchRecipesFailed(DioException error) : super(error: error);

  @override
  List<Object?> get props => [error!];
}

