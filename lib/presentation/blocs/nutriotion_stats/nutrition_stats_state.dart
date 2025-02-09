part of 'nutrition_stats_bloc.dart';

sealed class NutritionStatsState extends Equatable {
  const NutritionStatsState();
  
  @override
  List<Object> get props => [];
}

final class NutritionStatsInitial extends NutritionStatsState {}

final class NutritionStatsLoading extends NutritionStatsState {}

final class NutritionStatsLoaded extends NutritionStatsState {
  final NutritionStats nutritionStats;

  const NutritionStatsLoaded({required this.nutritionStats});

  @override
  List<Object> get props => [nutritionStats];
}

final class NutritionStatsLoadedError extends NutritionStatsState {
  final int codeHttp;
  final String message;

  const NutritionStatsLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}