import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food_place.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'foods_places_search_event.dart';
part 'foods_places_search_state.dart';

class FoodsPlacesSearchByNameBloc extends Bloc<FoodsPlacesSearchEvent, FoodsPlacesSearchState> {
  FoodsPlacesSearchByNameBloc() : super(FoodsPlacesSearchInitial()) {
    on<GetFoodsPlacesSearchByName>(_onGetFoodsPlacesSearchByName);
  }

  Future<void> _onGetFoodsPlacesSearchByName(GetFoodsPlacesSearchByName event, Emitter<FoodsPlacesSearchState> emit) async {
    emit(FoodsPlacesSearchLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(FoodsPlacesSearchByNameLoaded(foodsPlaces: await foodRepositoryProvider.getFoodsPlacesBByName(event.name)));
  }
}
