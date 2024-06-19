import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String? name, url;
  final int? id;
  final bool? saved;
  const RecipeEntity({
    this.name,
    this.id,
    this.url,
    this.saved,
  });

  @override
  List<Object?> get props => [name, id, url, saved];
}

class DetailEntity extends Equatable {
  final List<IngredientEntity>? ingredients;
  final List<String>? steps;
  final String? description, time, degree;
  const DetailEntity({
    this.ingredients,
    this.steps,
    this.degree,
    this.description,
    this.time,
  });

  @override
  List<Object?> get props => [
        ingredients,
        steps,
        description,
        degree,
        time,
      ];
}

class IngredientEntity extends Equatable {
  final String? name, quantity, img;
  const IngredientEntity({
    this.name,
    this.quantity,
    this.img,
  });

  @override
  List<Object?> get props => [name, quantity, img];
}
