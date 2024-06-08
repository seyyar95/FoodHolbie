

import 'package:flutter_test/flutter_test.dart';
import 'package:foodmania/injection_container.dart';
import 'package:foodmania/src/features/recipes/data/model/recipe_model.dart';
import 'package:foodmania/src/features/recipes/domain/repository/recipe_repository.dart';


void main() async {
  await initializeDependencies();
  late RecipeRespository recipeRepositoryImpl;
  
  setUp(() {
    recipeRepositoryImpl = s1<RecipeRespository>();
  });

  group("Recipe Repository test", () {
    test(
      "Recipe repository testing",
      () {
        //Arrange
        //Act
        final recipes = recipeRepositoryImpl.homeSearch(['Flour', 'Sugar', 'Eggs']);

        //Assert
        expect(recipes.then((value) => value.data![0]), isA<RecipeModel>());
      },
    );
  });
}
