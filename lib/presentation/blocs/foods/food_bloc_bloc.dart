import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';
part 'food_bloc_event.dart';
part 'food_bloc_state.dart';

class FoodBlocBloc extends Bloc<FoodBlocEvent, FoodBlocState> {

  FoodBlocBloc() : super(FoodBlocInitial()) {
    on<GetFoods>(_onGetFoods);
  }

  Future<void> _onGetFoods(GetFoods event, Emitter<FoodBlocState> emit) async {
    emit(FoodBlocLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(FoodBlocLoaded(foods: await foodRepositoryProvider.getFoods()));
  }
}
