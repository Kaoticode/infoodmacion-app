import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String name;
  final String imageURL;
  final double portion; 
  final double kcal;
  final double kJ; // Kilojulios
  final double fat; // Grasa total
  final double saturatedFat;
  final double carbohydrates;
  final double sugar; // Azúcar
  final double fiber; // Fibra
  final double proteins; // Proteínas
  final String productBy;
  final String type;
  final bool promoted;

  const Food({required this.name, required this.imageURL, required this.portion, required this.kcal, required this.kJ, required this.fat, required this.saturatedFat, required this.carbohydrates, required this.sugar, required this.fiber, required this.proteins, required this.productBy, required this.type, required this.promoted});

  @override
  List<Object?> get props => [name, imageURL, portion, kcal, kJ, fat, saturatedFat, carbohydrates, sugar, fiber, proteins, productBy, type, promoted];
}