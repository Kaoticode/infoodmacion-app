part of 'foods_places_search_bloc.dart';

sealed class FoodsPlacesSearchEvent extends Equatable {
  const FoodsPlacesSearchEvent();

  @override
  List<Object> get props => [];
}

final class GetFoodsPlacesSearchByName extends FoodsPlacesSearchEvent {
  final String name;

  const GetFoodsPlacesSearchByName({required this.name});

  @override
  List<Object> get props => [];
}