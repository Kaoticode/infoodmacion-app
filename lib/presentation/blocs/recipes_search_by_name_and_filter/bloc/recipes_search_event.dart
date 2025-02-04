part of 'recipes_search_bloc.dart';

sealed class RecipesSearchEvent extends Equatable {
  const RecipesSearchEvent();

  @override
  List<Object> get props => [];
}

final class GetRecipesSearchEvent extends RecipesSearchEvent {
  final String name;
  final String type;

  const GetRecipesSearchEvent({required this.name, required this.type});

  @override
  List<Object> get props => [name, type];
}