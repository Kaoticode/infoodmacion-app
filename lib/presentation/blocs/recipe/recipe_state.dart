part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();
  
  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}
final class RecipeLoading extends RecipeState {}

final class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;

  const RecipeLoaded({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

final class RecipeLoadedError extends RecipeState {
  final int codeHttp;
  final String message;

  const RecipeLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}