import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String? name;
  final int? id;
  const RecipeEntity({
    this.name,
    this.id,
  });

  @override
  List<Object?> get props => [name, id];
}
