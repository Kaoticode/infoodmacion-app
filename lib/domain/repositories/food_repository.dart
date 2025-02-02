import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/domain/entities/food_place.dart';

abstract class FoodRepository {
  Future<List<FoodPlace>> getFoodPlaces();
  Future<List<FoodPlace>> getFoodsPlacesBByName(String name);
  Future<List<Food>> getFoods();
  Future<List<Food>> getFoodByFoodPlace(int id);
  Future<List<Food>> getFoodByFoodPlaceFilterByName(int id, String name);
}