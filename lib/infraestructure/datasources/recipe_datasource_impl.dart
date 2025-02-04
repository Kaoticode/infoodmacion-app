import 'package:infoodmacion_app/api_services.dart';
import 'package:infoodmacion_app/domain/datasources/recipe_datasource.dart';
import 'package:infoodmacion_app/domain/entities/recipe.dart';
import 'package:infoodmacion_app/infraestructure/mappers/recipe_mapper.dart';
import 'package:infoodmacion_app/infraestructure/models/recipe_model.dart';

class RecipeDatasourceImpl implements RecipeDatasource {

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipesModel = recetas.map((recipeData) => RecipeModel.fromJson(recipeData)).toList();
    return recipesModel.map((recipeModel) => RecipeMapper.recipeModelToEntity(recipeModel)).toList();
  }
  
  @override
  Future<List<Recipe>> getRecipesByTypeAndName(String name, String type) async {
     return recetas.where((recipe) => recipe['type'].toString().toUpperCase() == type.toUpperCase())
      .map((recipe) => RecipeMapper.recipeModelToEntity(RecipeModel.fromJson(recipe))).toList();
  }
}