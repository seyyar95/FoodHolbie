import 'package:foodmania/src/core/resources/data_state.dart';
import '../../../../core/usecases/use_case.dart';
import '../repository/recipe_repository.dart';

class SaveRecipeUseCaseImpl implements SaveRecipeUseCase<DataState<int>> {
  final RecipeRespository _repository;
  const SaveRecipeUseCaseImpl(this._repository);

  @override
  Future<DataState<int>> call(int recipeId) {
    return _repository.saveRecipe(recipeId);
  }
}
