import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food_place.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'food_place_bloc_event.dart';
part 'food_place_bloc_state.dart';

class FoodPlaceBlocBloc extends Bloc<FoodPlaceBlocEvent, FoodPlaceBlocState> {

  FoodPlaceBlocBloc() : super(FoodPlaceInitial()) {
    on<GetFoodPlaces>(_onGetFoodPlaces);
  }

  Future<void> _onGetFoodPlaces(GetFoodPlaces event, Emitter<FoodPlaceBlocState> emit) async {
    emit(FoodPlaceLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(FoodPlaceLoaded(foods: await foodRepositoryProvider.getFoodPlaces()));
  }
    
}
