part of 'food_place_bloc_bloc.dart';

sealed class FoodPlaceBlocState extends Equatable {

  const FoodPlaceBlocState();
  
  @override
  List<Object> get props => [];
}

final class FoodPlaceInitial extends FoodPlaceBlocState {}
final class FoodPlaceLoading extends FoodPlaceBlocState {}

final class FoodPlaceLoaded extends FoodPlaceBlocState {
  final List<FoodPlace> foods;

  const FoodPlaceLoaded({required this.foods});

  copyWith({List<FoodPlace>? foods}) => FoodPlaceLoaded(foods: foods ?? this.foods);

  @override
  List<Object> get props => [foods];
}

final class FoodPlaceLoadedError extends FoodPlaceBlocState {
  final int codeHttp;
  final String message;

  const FoodPlaceLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}