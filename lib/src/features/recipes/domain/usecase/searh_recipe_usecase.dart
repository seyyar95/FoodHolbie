import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../../../../core/usecases/use_case.dart';
import '../repository/recipe_repository.dart';

class SearchRecipeByNameUseCaseImpl implements SearchRecipeByNameUseCase<DataState<List<RecipeEntity>>> {
  final RecipeRespository _respository;

  SearchRecipeByNameUseCaseImpl(this._respository);
  @override
  Future<DataState<List<RecipeEntity>>> call(String name) {
    return _respository.searchByName(name);
  }
}