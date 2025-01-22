import 'package:infoodmacion_app/domain/entities/recipe.dart';

class RecipeModel {
  final String name;
  final String type;
  final String image;
  final List<Ingredient> ingredients;
  final String description;
  final bool isPromoted;

  RecipeModel({required this.name, required this.type, required this.image, required this.ingredients, required this.description, required this.isPromoted});

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    name: json['nombre'], 
    type: json['type'], 
    image: json['imagen'], 
    ingredients: (json['ingredientes'] as List<dynamic>? ?? []).map((ingredient) => Ingredient(ingredient: ingredient)).toList(), 
    description: json['descripcion'], 
    isPromoted: json['promoted']
  );
}