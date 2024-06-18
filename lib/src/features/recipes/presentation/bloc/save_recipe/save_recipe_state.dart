part of 'save_recipe_bloc.dart';

abstract class SaveRecipeState extends Equatable {
  final int? id;
  final DioException? error;
  const SaveRecipeState({
    this.error,
    this.id,
  });
}

class SaveRecipeInitial extends SaveRecipeState {
  @override
  List<Object> get props => [];
}

class SaveRecipeLoading extends SaveRecipeState {
  @override
  List<Object> get props => [];
}

class SaveRecipeSuccess extends SaveRecipeState {
  const SaveRecipeSuccess(int? id) : super(id: id);

  @override
  List<Object> get props => [];
}

class SaveRecipeFailed extends SaveRecipeState {
  const SaveRecipeFailed(DioException? error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
