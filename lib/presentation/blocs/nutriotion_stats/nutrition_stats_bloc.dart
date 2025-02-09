import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/nutritrion_stats.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'nutrition_stats_event.dart';
part 'nutrition_stats_state.dart';

class NutritionStatsBloc extends Bloc<NutritionStatsEvent, NutritionStatsState> {
  NutritionStatsBloc() : super(NutritionStatsInitial()) {
    on<GetMyNutritionStats>(_onGetMyNutritionStats);
  }

  Future<void> _onGetMyNutritionStats(GetMyNutritionStats event, Emitter<NutritionStatsState> emit) async {
    emit(NutritionStatsLoaded(nutritionStats: await foodLocalRepositoryProvider.getNutritionStats()));
  }
}
