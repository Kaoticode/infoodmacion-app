import 'package:infoodmacion_app/domain/datasources/food_datasource.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/domain/entities/food_place.dart';
import 'package:infoodmacion_app/domain/repositories/food_repository.dart';

class FoodRepositiroyImpl implements FoodRepository {
  final FoodDatasource datasource;

  FoodRepositiroyImpl({required this.datasource});

  @override
  Future<List<FoodPlace>> getFoodPlaces() => datasource.getFoodPlaces();

  @override
  Future<List<Food>> getFoods() => datasource.getFoods();
  
  @override
  Future<List<Food>> getFoodByFoodPlace(int id) => datasource.getFoodByFoodPlace(id);
  
  @override
  Future<List<Food>> getFoodByFoodPlaceFilterByName(int id, String name) => datasource.getFoodByFoodPlaceFilterByName(id, name);
}