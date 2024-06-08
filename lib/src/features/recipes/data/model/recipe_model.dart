import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    super.id,
    super.name,
    super.time,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      time: json['preparation_time'],
    );
  }
}
