part of 'nutrition_stats_bloc.dart';

sealed class NutritionStatsEvent extends Equatable {
  const NutritionStatsEvent();

  @override
  List<Object> get props => [];
}

final class GetMyNutritionStats extends NutritionStatsEvent {}