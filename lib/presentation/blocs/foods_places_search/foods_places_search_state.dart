part of 'foods_places_search_bloc.dart';

sealed class FoodsPlacesSearchState extends Equatable {
  const FoodsPlacesSearchState();
  
  @override
  List<Object> get props => [];
}

final class FoodsPlacesSearchInitial extends FoodsPlacesSearchState {}
final class FoodsPlacesSearchLoading extends FoodsPlacesSearchState {}

final class FoodsPlacesSearchByNameLoaded extends FoodsPlacesSearchState {
  final List<FoodPlace> foodsPlaces;

  const FoodsPlacesSearchByNameLoaded({required this.foodsPlaces});

  @override
  List<Object> get props => [foodsPlaces];
}

final class FoodsPlacesSearchLoadedError extends FoodsPlacesSearchState {
  final int codeHttp;
  final String message;

  const FoodsPlacesSearchLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}