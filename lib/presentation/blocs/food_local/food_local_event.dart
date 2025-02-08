part of 'food_local_bloc.dart';

sealed class FoodLocalEvent extends Equatable {
  const FoodLocalEvent();

  @override
  List<Object> get props => [];
}

class AddFoodToCart extends FoodLocalEvent {
  final Food food;

  const AddFoodToCart({required this.food});

  @override
  List<Object> get props => [food];
}