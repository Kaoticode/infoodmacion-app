part of 'food_bloc_bloc.dart';

sealed class FoodBlocState extends Equatable {
  const FoodBlocState();
  
  @override
  List<Object> get props => [];
}

final class FoodBlocInitial extends FoodBlocState {}
final class FoodBlocLoading extends FoodBlocState {}

final class FoodBlocLoaded extends FoodBlocState {
  final List<Food> foods;

  const FoodBlocLoaded({required this.foods});

  @override
  List<Object> get props => [foods];
}

final class FoodBlocLoadedError extends FoodBlocState{
  final int codeHttp;
  final String message;

  const FoodBlocLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}