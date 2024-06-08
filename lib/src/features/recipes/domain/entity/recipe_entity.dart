import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String? name;
  final int? id, time;
  const RecipeEntity({
    this.name,
    this.id,
    this.time,
  });

  @override
  List<Object?> get props => [name, id, time];
}
