import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

abstract class RecipeRespository {
  Future<DataState<List<RecipeEntity>>> homeSearch(List<String> ingredients);
  Future<DataState<DetailEntity>> recipeDetail(int id);
  Future<DataState<List<RecipeEntity>>> searchByName(String name);
  Future<DataState<List<RecipeEntity>>> searchInitial();
  Future<DataState<int>> saveRecipe(int recipeId);
  Future<DataState<List<RecipeEntity>>> getSavedRecipes();
}
