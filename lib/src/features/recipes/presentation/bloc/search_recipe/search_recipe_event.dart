part of 'search_recipe_bloc.dart';

abstract class SearchRecipeEvent extends Equatable {
  const SearchRecipeEvent();
}

class SearchRecipeByNameInput extends SearchRecipeEvent {
  final String? name;
  const SearchRecipeByNameInput(this.name);

  @override
  List<Object?> get props => [name];
}
