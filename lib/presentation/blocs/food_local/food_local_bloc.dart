import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'food_local_event.dart';
part 'food_local_state.dart';

class FoodLocalBloc extends Bloc<FoodLocalEvent, FoodLocalState> {
  FoodLocalBloc() : super(FoodLocalInitial()) {
    on<AddFoodToCart>(_onAddFoodToCart);
    on<GetFoodCart>(_onGetFoodCart);
    on<UpdateFoodCart>(_onUpdateFoodCart);
  }

  Future<void> _onAddFoodToCart(AddFoodToCart event, Emitter<FoodLocalState> emit) async {
    foodLocalRepositoryProvider.addFoodToCart(event.food);
  }

  Future<void> _onGetFoodCart(GetFoodCart event, Emitter<FoodLocalState> emit) async {
    emit(FoodLocalLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(FoodLocalLoaded(foodsLocal: await foodLocalRepositoryProvider.getFoodCart()));
  }

  Future<void> _onUpdateFoodCart(UpdateFoodCart event, Emitter<FoodLocalState> emit) async {
    await foodLocalRepositoryProvider.updateFoodCart(event.name, event.newAmount);
    emit(FoodLocalLoaded(foodsLocal: await foodLocalRepositoryProvider.getFoodCart()));
  }
}
