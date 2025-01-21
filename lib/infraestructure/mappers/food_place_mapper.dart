import 'package:infoodmacion_app/domain/entities/food_place.dart';
import 'package:infoodmacion_app/infraestructure/models/food_place_model.dart';

class FoodPlaceMapper {
  static FoodPlace foodPlaceModelToEntity(FoodPlaceModel model) => 
    FoodPlace(id: model.id, name: model.name, image: model.image, description: model.description, isPromoted: model.isPromoted);
}