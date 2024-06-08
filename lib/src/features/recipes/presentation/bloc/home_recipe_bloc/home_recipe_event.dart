import 'package:equatable/equatable.dart';

abstract class HomeRecipeEvents extends Equatable {
  const HomeRecipeEvents();
}

class HomeRecipeInput extends HomeRecipeEvents {
  final List<String>? ingredients;
  const HomeRecipeInput({this.ingredients});

  @override
  List<Object?> get props => [ingredients];
}
