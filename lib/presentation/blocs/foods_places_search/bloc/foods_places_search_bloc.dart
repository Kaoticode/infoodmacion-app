import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'foods_places_search_event.dart';
part 'foods_places_search_state.dart';

class FoodsPlacesSearchBloc extends Bloc<FoodsPlacesSearchEvent, FoodsPlacesSearchState> {
  FoodsPlacesSearchBloc() : super(FoodsPlacesSearchInitial()) {
    on<GetFoodsByPlaceFilterByName>(_onGetFoodsByPlace);
  }

  Future<void> _onGetFoodsByPlace(GetFoodsByPlaceFilterByName event, Emitter<FoodsPlacesSearchState> emit) async {
    final foods = await foodRepositoryProvider.getFoodByFoodPlaceFilterByName(event.id, event.name);
    emit(FoodsPlacesSearchLoaded(foods: foods));
  }
}
