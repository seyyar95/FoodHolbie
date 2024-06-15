part of 'recipe_detail_bloc.dart';

sealed class RecipeDetailEvent extends Equatable {
  const RecipeDetailEvent();
}

class RecipeDetail extends RecipeDetailEvent {
  final int? id;
  const RecipeDetail({this.id});

  @override
  List<Object?> get props => [id];
}
