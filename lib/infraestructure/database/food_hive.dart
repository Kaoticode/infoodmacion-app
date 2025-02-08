// ignore_for_file: annotate_overrides, overridden_fields

import 'package:hive/hive.dart';
import '../../domain/entities/food.dart';

part 'food_hive.g.dart';

@HiveType(typeId: 1) // 🔥 Identificador único para Hive
class FoodHive extends Food {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String imageURL;

  @HiveField(2)
  final double portion;

  @HiveField(3)
  final double kcal;

  @HiveField(4)
  final double kJ;

  @HiveField(5)
  final double fat;

  @HiveField(6)
  final double saturatedFat;

  @HiveField(7)
  final double carbohydrates;

  @HiveField(8)
  final double sugar;

  @HiveField(9)
  final double fiber;

  @HiveField(10)
  final double proteins;

  @HiveField(11)
  final String productBy;

  @HiveField(12)
  final String type;

  @HiveField(13)
  final bool promoted;

  @HiveField(14)
  final int quantity;

  const FoodHive({
    required this.name,
    required this.imageURL,
    required this.portion,
    required this.kcal,
    required this.kJ,
    required this.fat,
    required this.saturatedFat,
    required this.carbohydrates,
    required this.sugar,
    required this.fiber,
    required this.proteins,
    required this.productBy,
    required this.type,
    required this.promoted,
    this.quantity = 1,
  }) : super(
          name: name,
          imageURL: imageURL,
          portion: portion,
          kcal: kcal,
          kJ: kJ,
          fat: fat,
          saturatedFat: saturatedFat,
          carbohydrates: carbohydrates,
          sugar: sugar,
          fiber: fiber,
          proteins: proteins,
          productBy: productBy,
          type: type,
          promoted: promoted,
          quantity: quantity,
        );

  // 🔥 Convertir JSON a `FoodHive`
  factory FoodHive.fromJson(Map<String, dynamic> json) {
    return FoodHive(
      name: json["nombre"],
      imageURL: json["imagen"],
      portion: (json["porcion"] as num).toDouble(),
      kcal: (json["Kcal"] as num).toDouble(),
      kJ: (json["KJ"] as num).toDouble(),
      fat: (json["Grasa"] as num).toDouble(),
      saturatedFat: (json["Grasa_saturada"] as num).toDouble(),
      carbohydrates: (json["Hidratos_de_carbono"] as num).toDouble(),
      sugar: (json["azucar"] as num).toDouble(),
      fiber: (json["fibra"] as num).toDouble(),
      proteins: (json["proteinas"] as num).toDouble(),
      productBy: json["product_by"],
      type: json["type"],
      promoted: json["promoted"],
      quantity: (json["cantidad"] ?? 1).toDouble(),
    );
  }

  // 🔥 Convertir `FoodHive` a JSON
  Map<String, dynamic> toJson() {
    return {
      "nombre": name,
      "imagen": imageURL,
      "porcion": portion,
      "Kcal": kcal,
      "KJ": kJ,
      "Grasa": fat,
      "Grasa_saturada": saturatedFat,
      "Hidratos_de_carbono": carbohydrates,
      "azucar": sugar,
      "fibra": fiber,
      "proteinas": proteins,
      "product_by": productBy,
      "type": type,
      "promoted": promoted,
      "cantidad": quantity,
    };
  }
}
