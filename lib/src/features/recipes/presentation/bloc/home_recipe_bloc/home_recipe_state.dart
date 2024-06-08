import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/recipe_entity.dart';

abstract class HomeRecipeState extends Equatable {
  final List<RecipeEntity>? recipes;
  final DioException? error;
  const HomeRecipeState({
    this.error,
    this.recipes,
  });
}

class HomeRecipeInitial extends HomeRecipeState {
  @override
  List<Object> get props => [];
}

class HomeRecipeLoading extends HomeRecipeState {
  @override
  List<Object> get props => [];
}

class HomeRecipeSuccess extends HomeRecipeState {
  const HomeRecipeSuccess(List<RecipeEntity> recipe) : super(recipes: recipe);

  @override
  List<Object> get props => [recipes!];
}

class HomeRecipeFailed extends HomeRecipeState {
  const HomeRecipeFailed(DioException? error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
