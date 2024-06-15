import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String? name, url;
  final int? id;
  const RecipeEntity({
    this.name,
    this.id,
    this.url,
  });

  @override
  List<Object?> get props => [name, id, url];
}

class DetailEntity extends Equatable {
  final List<IngredientEntity>? ingredients;
  final List<String>? steps;
  const DetailEntity({
    this.ingredients,
    this.steps,
  });

  @override
  List<Object?> get props => [ingredients, steps];
}

class IngredientEntity extends Equatable {
  final String? name, quantity;
  const IngredientEntity({
    this.name,
    this.quantity,
  });

  @override
  List<Object?> get props => [name, quantity];
}
