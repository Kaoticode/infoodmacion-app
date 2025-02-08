import 'package:infoodmacion_app/domain/entities/food.dart';

abstract class FoodLocalRepository {
  Future<void> addFoodToCart(Food food);
  Future<void> updateFoodCart(String name, int amount);
  Future<List<Food>> getFoodCart();
}