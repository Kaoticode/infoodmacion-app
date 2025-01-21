import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/infraestructure/models/food_model.dart';

class FoodMapper {
  static Food foodModelToEntity(FoodModel model) => Food(
    name: model.name, 
    imageURL: model.imageURL, 
    portion: model.portion, 
    kcal: model.kcal, 
    kJ: model.kJ, 
    fat: model.fat, 
    saturatedFat: model.saturatedFat, 
    carbohydrates: model.carbohydrates, 
    sugar: model.sugar, 
    fiber: model.fiber, 
    proteins: model.proteins, 
    productBy: model.productBy,
    type: model.type, 
    promoted: model.promoted
  );
}