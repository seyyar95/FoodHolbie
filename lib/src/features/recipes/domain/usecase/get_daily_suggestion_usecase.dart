import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

import '../repository/recipe_repository.dart';

class GetDailySuggestionUseCaseImpl
    implements GetDailySuggestionUseCase<DataState<List<RecipeEntity>>> {
  final RecipeRespository _respository;
  const GetDailySuggestionUseCaseImpl(this._respository);
  @override
  Future<DataState<List<RecipeEntity>>> call() {
    return _respository.getDailySuggestion();
  }
}
