import 'package:infoodmacion_app/domain/entities/recipe.dart';

abstract class RecipeDatasource {
  Future<List<Recipe>> getRecipes();
}