import 'package:infoodmacion_app/domain/datasources/food_local_datasource.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/domain/repositories/food_local_repository.dart';

class FoodLocalRepositoryImpl implements FoodLocalRepository {
  final FoodLocalDatasource datasource;

  FoodLocalRepositoryImpl({required this.datasource});

  @override
  Future<void> addFoodToCart(Food food) => datasource.addFoodToCart(food);

  @override
  Future<List<Food>> getFoodCart() => datasource.getFoodCart();

  @override
  Future<void> updateFoodCart(String name, int amount) => datasource.updateFoodCart(name, amount);
}