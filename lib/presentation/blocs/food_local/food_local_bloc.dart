import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'food_local_event.dart';
part 'food_local_state.dart';

class FoodLocalBloc extends Bloc<FoodLocalEvent, FoodLocalState> {
  FoodLocalBloc() : super(FoodLocalInitial()) {
    on<AddFoodToCart>(_onAddFoodToCart);
  }

  Future<void> _onAddFoodToCart(AddFoodToCart event, Emitter<FoodLocalState> emit) async {
    foodLocalRepositoryProvider.addFoodToCart(event.food);
  }
}
