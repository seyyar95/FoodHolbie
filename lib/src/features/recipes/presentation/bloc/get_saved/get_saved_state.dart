part of 'get_saved_bloc.dart';

sealed class GetSavedState extends Equatable {
  final List<RecipeEntity>? recipes;
  final DioException? error;
  const GetSavedState({
    this.error,
    this.recipes,
  });
}

class GetSavedInitial extends GetSavedState {
  @override
  List<Object> get props => [];
}

class GetSavedLoading extends GetSavedState {
  @override
  List<Object> get props => [];
}

class GetSavedSuccess extends GetSavedState {
  const GetSavedSuccess(List<RecipeEntity> recipe) : super(recipes: recipe);

  @override
  List<Object> get props => [recipes!];
}

class GetSavedFailed extends GetSavedState {
  const GetSavedFailed(DioException? error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
