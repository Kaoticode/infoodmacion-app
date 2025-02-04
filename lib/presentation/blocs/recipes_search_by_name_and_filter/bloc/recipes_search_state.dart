part of 'recipes_search_bloc.dart';

sealed class RecipesSearchState extends Equatable {
  const RecipesSearchState();
  
  @override
  List<Object> get props => [];
}

final class RecipesSearchInitial extends RecipesSearchState {}
final class RecipesSearchLoading extends RecipesSearchState {}

final class RecipesSearchLoaded extends RecipesSearchState {
  final List<Recipe> recipes;

  const RecipesSearchLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

final class RecipesSearchLoadedError extends RecipesSearchState {
  final int codeHttp;
  final String message;

  const RecipesSearchLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}