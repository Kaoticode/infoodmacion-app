part of 'foods_places_search_bloc.dart';

sealed class FoodsPlacesSearchState extends Equatable {
  const FoodsPlacesSearchState();
  
  @override
  List<Object> get props => [];
}

final class FoodsPlacesSearchInitial extends FoodsPlacesSearchState {}
final class FoodsPlacesSearchLoading extends FoodsPlacesSearchState {}

final class FoodsPlacesSearchLoaded extends FoodsPlacesSearchState {
  final List<Food> foods;

  const FoodsPlacesSearchLoaded({required this.foods});

  @override
  List<Object> get props => [foods];
}

final class FoodsPlacesSearchError extends FoodsPlacesSearchState {
  final int codeHttp;
  final String message;

  const FoodsPlacesSearchError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}