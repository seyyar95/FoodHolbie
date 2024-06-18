part of 'save_recipe_bloc.dart';

sealed class SaveRecipeEvent extends Equatable {
  const SaveRecipeEvent();
}

class SaveID extends SaveRecipeEvent {
  final int? id;
  const SaveID({this.id});

  @override
  List<Object?> get props => [id];
}
