part of 'food_place_bloc_bloc.dart';

sealed class FoodPlaceBlocEvent extends Equatable {
  const FoodPlaceBlocEvent();

  @override
  List<Object> get props => [];
}


class GetFoodPlaces extends FoodPlaceBlocEvent {}