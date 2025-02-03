import 'package:infoodmacion_app/api_services.dart';
import 'package:infoodmacion_app/domain/datasources/food_datasource.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/domain/entities/food_place.dart';
import 'package:infoodmacion_app/infraestructure/mappers/food_mapper.dart';
import 'package:infoodmacion_app/infraestructure/mappers/food_place_mapper.dart';
import 'package:infoodmacion_app/infraestructure/models/food_model.dart';
import 'package:infoodmacion_app/infraestructure/models/food_place_model.dart';

class FoodDatasourceImpl implements FoodDatasource {
  @override
  Future<List<FoodPlace>> getFoodPlaces() async {
    final foodPlaces = establecimientos.map((foodPlace) => FoodPlaceModel.fromJson(foodPlace)).toList();
    return foodPlaces.map((foodPlaceModel) => FoodPlaceMapper.foodPlaceModelToEntity(foodPlaceModel)).toList();
  }

  @override
  Future<List<FoodPlace>> getFoodsPlacesBByName(String name) async {
    final foodPlaces = establecimientos
      .where((foodPlace) => foodPlace['nombre'].toString().toLowerCase().contains(name.toLowerCase()))
      .map((foodPlace) => FoodPlaceModel.fromJson(foodPlace)).toList();
    return foodPlaces.map((foodPlaceModel) => FoodPlaceMapper.foodPlaceModelToEntity(foodPlaceModel)).toList();
  }

  @override
  Future<List<Food>> getFoods() async {
    final foods = productos.map((food) => FoodModel.fromJson(food)).toList();
    return foods.map((foodModel) => FoodMapper.foodModelToEntity(foodModel)).toList();
  }
  
  @override
  Future<List<Food>> getFoodByFoodPlace(int id) async {
    final foods = productos.where((product) => product['product_by'] == id).map((product) => FoodModel.fromJson(product)).toList();
    return foods.map((foodModel) => FoodMapper.foodModelToEntity(foodModel)).toList();
  }
  
  @override
  Future<List<Food>> getFoodByFoodPlaceFilterByName(int id, String name) async {
    final foods = productos.where(
      (product) => product['product_by'] == id && product['nombre'].toString().toLowerCase().contains(name.toLowerCase())
    ).map((product) => FoodModel.fromJson(product)).toList();
    return foods.map((foodModel) => FoodMapper.foodModelToEntity(foodModel)).toList();
  }
  
  @override
  Future<List<Food>> getFoodsByName(String name) async {
    final foods = productos.where((product) => product['nombre'].toString().toLowerCase().contains(name.toLowerCase()))
      .map((product) => FoodModel.fromJson(product)).toList();
    return foods.map((foodModel) => FoodMapper.foodModelToEntity(foodModel)).toList();
  }
}