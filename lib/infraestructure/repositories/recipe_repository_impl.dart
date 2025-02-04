import 'package:infoodmacion_app/domain/datasources/recipe_datasource.dart';
import 'package:infoodmacion_app/domain/entities/recipe.dart';
import 'package:infoodmacion_app/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDatasource datasource;

  RecipeRepositoryImpl({required this.datasource});

  @override
  Future<List<Recipe>> getRecipes() => datasource.getRecipes();
  
  @override
  Future<List<Recipe>> getRecipesByTypeAndName(String name, String type) => datasource.getRecipesByTypeAndName(name, type);
}