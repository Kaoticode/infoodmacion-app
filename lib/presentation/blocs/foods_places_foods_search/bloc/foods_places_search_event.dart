part of 'foods_places_search_bloc.dart';

sealed class FoodsPlacesSearchEvent extends Equatable {
  const FoodsPlacesSearchEvent();

  @override
  List<Object> get props => [];
}

final class GetFoodsByPlaceFilterByName extends FoodsPlacesSearchEvent {
  final int id;
  final String name;

  const GetFoodsByPlaceFilterByName({required this.id, required this.name});
  
  @override
  List<Object> get props => [id, name];
}