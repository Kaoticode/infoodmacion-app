import 'package:hive/hive.dart';
import 'package:infoodmacion_app/domain/datasources/food_local_datasource.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/infraestructure/database/food_hive.dart';

class FoodLocalDatasourceImpl implements FoodLocalDatasource {
  @override
  Future<void> addFoodToCart(FoodHive food) async {
    final box = Hive.box<FoodHive>('foodsBox');

    int index = box.values.toList().indexWhere(
        (foodData) => foodData.name.toLowerCase() == food.name.toLowerCase());

    if (index == -1) {
      print('entre como nuevo');
      await box.add(food);
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
      print('me actualizaron');
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
}