import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../repository/recipe_repository.dart';

class HomeRecipeUseCaseImpl
    implements HomeSearchRecipeUseCase<DataState<List<RecipeEntity>>> {
  final RecipeRespository _respository;
  const HomeRecipeUseCaseImpl(this._respository);
  @override
  Future<DataState<List<RecipeEntity>>> call(List<String> ingredients) {
    return _respository.homeSearch(ingredients);
  }
}
