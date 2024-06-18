import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/use_case.dart';
import '../repository/recipe_repository.dart';

class GetSavedRecipeUseCaseImpl
    implements GetSavedRecipeUseCase<DataState<List<RecipeEntity>>> {
  final RecipeRespository _repository;
  const GetSavedRecipeUseCaseImpl(this._repository);

  @override
  Future<DataState<List<RecipeEntity>>> call() {
    return _repository.getSavedRecipes();
  }
}
