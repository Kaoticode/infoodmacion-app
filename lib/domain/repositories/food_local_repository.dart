import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/infraestructure/database/food_hive.dart';

abstract class FoodLocalRepository {
  Future<void> addFoodToCart(FoodHive food);
  Future<void> updateFoodCart(String name, int amount);
  Future<List<Food>> getFoodCart();
}