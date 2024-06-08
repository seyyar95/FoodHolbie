import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../../../../core/usecases/use_case.dart';
import '../repository/recipe_repository.dart';

class SaveRecipeUseCaseImpl
    implements SaveRecipeUseCase<DataState<List<RecipeEntity>>> {
  final RecipeRespository _repository;
  const SaveRecipeUseCaseImpl(this._repository);

  @override
  Future<DataState<List<RecipeEntity>>> call(int recipeId) {
    return _repository.saveRecipe(recipeId);
  }
}
