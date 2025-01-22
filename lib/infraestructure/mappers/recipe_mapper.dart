import 'package:infoodmacion_app/domain/entities/recipe.dart';
import 'package:infoodmacion_app/infraestructure/models/recipe_model.dart';

class RecipeMapper {
  static Recipe recipeModelToEntity(RecipeModel model) => Recipe(
    name: model.name, 
    type: model.type, 
    image: model.image, 
    ingredients: model.ingredients, 
    description: model.description, 
    isPromoted: model.isPromoted
  );
}