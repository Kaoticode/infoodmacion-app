import 'package:hive/hive.dart';
import 'package:infoodmacion_app/domain/datasources/food_local_datasource.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/domain/entities/nutritrion_stats.dart';
import 'package:infoodmacion_app/infraestructure/database/food_hive.dart';

class FoodLocalDatasourceImpl implements FoodLocalDatasource {
  @override
  Future<void> addFoodToCart(Food food) async {
    final box = Hive.box<FoodHive>('foodsBox');

    int index = box.values.toList().indexWhere(
        (foodData) => foodData.name.toLowerCase() == food.name.toLowerCase());

    if (index == -1) {
      await box.add(FoodHive(
          name: food.name,
          imageURL: food.imageURL,
          portion: food.portion,
          kcal: food.kcal,
          kJ: food.kJ,
          fat: food.fat,
          saturatedFat: food.saturatedFat,
          carbohydrates: food.carbohydrates,
          sugar: food.sugar,
          fiber: food.fiber,
          proteins: food.proteins,
          productBy: food.productBy,
          type: food.type,
          promoted: food.promoted,
          quantity: 1));
      return;
    }

    var existingFood = box.getAt(index);

    if (existingFood != null) {
      var updatedFood = FoodHive(
          name: existingFood.name,
          imageURL: existingFood.imageURL,
          portion: existingFood.portion,
          kcal: existingFood.kcal,
          kJ: existingFood.kJ,
          fat: existingFood.fat,
          saturatedFat: existingFood.saturatedFat,
          carbohydrates: existingFood.carbohydrates,
          sugar: existingFood.sugar,
          fiber: existingFood.fiber,
          proteins: existingFood.proteins,
          productBy: existingFood.productBy,
          type: existingFood.type,
          promoted: existingFood.promoted,
          quantity: existingFood.quantity + 1);

      await box.putAt(index, updatedFood);
    }
  }

  @override
  Future<void> updateFoodCart(String name, int amount) async {
    final box = Hive.box<FoodHive>('foodsBox');

    int index = box.values.toList().indexWhere(
        (foodData) => foodData.name.toLowerCase() == name.toLowerCase());

    if (index == -1) return;

    var existingFood = box.getAt(index);

    if (existingFood != null) {
      int newQuantity = existingFood.quantity + amount;

      if (newQuantity <= 0) {
        await box.deleteAt(index);
        return;
      }
      var updatedFood = FoodHive(
        name: existingFood.name,
        imageURL: existingFood.imageURL,
        portion: existingFood.portion,
        kcal: existingFood.kcal,
        kJ: existingFood.kJ,
        fat: existingFood.fat,
        saturatedFat: existingFood.saturatedFat,
        carbohydrates: existingFood.carbohydrates,
        sugar: existingFood.sugar,
        fiber: existingFood.fiber,
        proteins: existingFood.proteins,
        productBy: existingFood.productBy,
        type: existingFood.type,
        promoted: existingFood.promoted,
        quantity: newQuantity,
      );

      await box.putAt(index, updatedFood);
    }
  }

  @override
  Future<List<Food>> getFoodCart() async {
    final box = Hive.box<FoodHive>('foodsBox');

    List<Food> foodCart = box.values
        .map((foodHive) => Food(
              name: foodHive.name,
              imageURL: foodHive.imageURL,
              portion: foodHive.portion,
              kcal: foodHive.kcal,
              kJ: foodHive.kJ,
              fat: foodHive.fat,
              saturatedFat: foodHive.saturatedFat,
              carbohydrates: foodHive.carbohydrates,
              sugar: foodHive.sugar,
              fiber: foodHive.fiber,
              proteins: foodHive.proteins,
              productBy: foodHive.productBy,
              type: foodHive.type,
              promoted: foodHive.promoted,
              quantity: foodHive.quantity,
            ))
        .toList();
    return foodCart;
  }

  @override
  Future<NutritionStats> getNutritionStats() async {
    final box = Hive.box<FoodHive>('foodsBox');

    double totalKcal = 0;
    double totalKJ = 0;
    double totalFat = 0;
    double totalSaturatedFat = 0;
    double totalCarbohydrates = 0;
    double totalSugar = 0;
    double totalFiber = 0;
    double totalProteins = 0;

    for (var food in box.values) {
      totalKcal += food.kcal * food.quantity;
      totalKJ += food.kJ * food.quantity;
      totalFat += food.fat * food.quantity;
      totalSaturatedFat += food.saturatedFat * food.quantity;
      totalCarbohydrates += food.carbohydrates * food.quantity;
      totalSugar += food.sugar * food.quantity;
      totalFiber += food.fiber * food.quantity;
      totalProteins += food.proteins * food.quantity;
    }

    return NutritionStats(
      kcal: totalKcal,
      kJ: totalKJ,
      fat: totalFat,
      saturatedFat: totalSaturatedFat,
      carbohydrates: totalCarbohydrates,
      sugar: totalSugar,
      fiber: totalFiber,
      totalProteins: totalProteins,
    );
  }
}
