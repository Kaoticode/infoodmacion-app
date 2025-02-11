import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/recipe.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<GetRecipes>(_onGetRecipes);
  }

  Future<void> _onGetRecipes(GetRecipes event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(RecipeLoaded(recipes: await recipeRepositoryProvider.getRecipes()));
  }
}
