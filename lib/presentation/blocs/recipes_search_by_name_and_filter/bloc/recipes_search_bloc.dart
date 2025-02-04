import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/recipe.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'recipes_search_event.dart';
part 'recipes_search_state.dart';

class RecipesSearchBloc extends Bloc<RecipesSearchEvent, RecipesSearchState> {
  RecipesSearchBloc() : super(RecipesSearchInitial()) {
    on<GetRecipesSearchEvent>(_onGetRecipesByNameAndType);
  }

  Future<void> _onGetRecipesByNameAndType(GetRecipesSearchEvent event, Emitter<RecipesSearchState> emit) async {
    emit(RecipesSearchLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(RecipesSearchLoaded(recipes: await recipeRepositoryProvider.getRecipesByTypeAndName(event.name, event.type)));
  }
}
