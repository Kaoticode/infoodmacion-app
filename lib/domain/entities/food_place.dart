import 'package:equatable/equatable.dart';

class FoodPlace extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final bool isPromoted;

  const FoodPlace({required this.id, required this.name, required this.image, required this.description, required this.isPromoted});
  
  @override
  List<Object?> get props => [id, name, image, description, isPromoted];
}