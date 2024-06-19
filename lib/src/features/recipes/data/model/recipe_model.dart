import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    super.id,
    super.name,
    super.url,
    super.saved,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      url: json['img'],
      saved: json['saved'],
    );
  }
}

class DetailModel extends DetailEntity {
  const DetailModel({
    super.ingredients,
    super.steps,
    super.degree,
    super.description,
    super.time,
  });
  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map(
            (e) => IngredientModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      steps: List<String>.from(json['steps']),
      degree: json['degree'],
      description: json['description'],
      time: json['time'],
    );
  }
}

class IngredientModel extends IngredientEntity {
  const IngredientModel({super.quantity, super.name, super.img});
  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      name: json['name'],
      quantity: json['quantity'],
      img: json['img'],
    );
  }
}
