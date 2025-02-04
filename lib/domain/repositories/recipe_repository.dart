import 'package:infoodmacion_app/domain/entities/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<List<Recipe>> getRecipesByTypeAndName(String name, String type);
}