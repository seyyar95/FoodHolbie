part of 'recipe_detail_bloc.dart';

abstract class RecipeDetailState extends Equatable {
  final DetailEntity? detail;
  final DioException? error;
  const RecipeDetailState({
    this.error,
    this.detail,
  });
}

class RecipeDetailInitial extends RecipeDetailState {
  @override
  List<Object> get props => [];
}

class RecipeDetailLoading extends RecipeDetailState {
  @override
  List<Object> get props => [];
}

class RecipeDetailSuccess extends RecipeDetailState {
  const RecipeDetailSuccess(DetailEntity detail) : super(detail: detail);

  @override
  List<Object> get props => [detail!];
}

class RecipeDetailFailed extends RecipeDetailState {
  const RecipeDetailFailed(DioException? error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
