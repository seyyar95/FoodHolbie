import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../repository/recipe_repository.dart';

class RecipeDetailUseCaseImpl
    implements RecipeDetailUseCase<DataState<DetailEntity>> {
  final RecipeRespository _respository;
  const RecipeDetailUseCaseImpl(this._respository);
  @override
  Future<DataState<DetailEntity>> call(int id) {
    return _respository.recipeDetail(id);
  }
}
