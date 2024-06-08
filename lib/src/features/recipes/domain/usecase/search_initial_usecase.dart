import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../../../../core/usecases/use_case.dart';

import '../repository/recipe_repository.dart';

class SearchInitialUseCaseImpl
    implements SearchInitialUseCase<DataState<List<RecipeEntity>>> {
  final RecipeRespository _respository;
  const SearchInitialUseCaseImpl(this._respository);

  @override
  Future<DataState<List<RecipeEntity>>> call() {
    return _respository.searchInitial();
  }
}
