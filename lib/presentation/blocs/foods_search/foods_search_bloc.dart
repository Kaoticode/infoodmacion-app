import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/food.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'foods_search_event.dart';
part 'foods_search_state.dart';

class FoodsSearchBloc extends Bloc<FoodsSearchEvent, FoodsSearchState> {
  FoodsSearchBloc() : super(FoodsSearchInitial()) {
    on<GetFoodsSearchByName>(_onGetFoodsSearchByName);
  }

  Future<void> _onGetFoodsSearchByName(GetFoodsSearchByName event, Emitter<FoodsSearchState> emit) async {
    emit(FoodsSearchLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(FoodsSearchLoaded(foods: await foodRepositoryProvider.getFoodsByName(event.name)));
  }
}
