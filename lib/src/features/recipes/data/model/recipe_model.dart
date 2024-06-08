import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    super.id,
    super.name,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
