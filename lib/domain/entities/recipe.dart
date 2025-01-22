import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String name;
  final String type;
  final String image;
  final List<Ingredient> ingredients;
  final String description;
  final bool isPromoted;

  const Recipe({required this.name, required this.type, required this.image, required this.ingredients, required this.description, required this.isPromoted});

  @override
  List<Object?> get props => [name, type, image, ingredients, description, isPromoted];
}

class Ingredient extends Equatable {
  final String ingredient;

  const Ingredient({required this.ingredient});

  @override
  List<Object?> get props => [ingredient];
}