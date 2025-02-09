import 'package:equatable/equatable.dart';

class NutritionStats extends Equatable {
  final double kcal;
  final double kJ;
  final double fat;
  final double saturatedFat;
  final double carbohydrates;
  final double sugar;
  final double fiber;
  final double totalProteins;

  const NutritionStats({
    required this.kcal,
    required this.kJ,
    required this.fat,
    required this.saturatedFat,
    required this.carbohydrates,
    required this.sugar,
    required this.fiber,
    required this.totalProteins,
  });

  @override
  List<Object?> get props => [kcal, kJ, fat, saturatedFat, carbohydrates, sugar, fiber, totalProteins];
}
