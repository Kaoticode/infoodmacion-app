part of 'food_local_bloc.dart';

sealed class FoodLocalState extends Equatable {
  const FoodLocalState();
  
  @override
  List<Object> get props => [];
}

final class FoodLocalInitial extends FoodLocalState {}

class FoodLocalLoading extends FoodLocalState {}

class FoodLocalLoaded extends FoodLocalState {
  final List<Food> foodsLocal;

  const FoodLocalLoaded({required this.foodsLocal});

  @override
  List<Object> get props => [foodsLocal];
}

class FoodLocalLoadedError extends FoodLocalState {
  final int codeHttp;
  final String message;

  const FoodLocalLoadedError({required this.codeHttp, required this.message});

  @override 
  List<Object> get props => [codeHttp, message];
}