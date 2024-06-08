abstract class LoginUseCase<Type> {
  Future<Type> call(String email, String password);
}

abstract class RegisterUseCase<Type> {
  Future<Type> call({
    String email,
    String password,
    String firstName,
  });
}

abstract class HomeSearchRecipeUseCase<Type> {
  Future<Type> call(List<String> ingredients);
}

abstract class SearchRecipeByNameUseCase<Type> {
  Future<Type> call(String name);
}

abstract class SearchInitialUseCase<Type> {
  Future<Type> call();
}

abstract class SaveRecipeUseCase<Type> {
  Future<Type> call(int recipeId);
}
